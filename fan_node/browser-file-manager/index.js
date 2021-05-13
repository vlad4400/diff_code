#!/usr/bin/env node

const http = require('http');
const path = require('path');
const fs = require('fs');
const colors = require('colors');
const io = require('socket.io');
var ss = require('socket.io-stream');
const { Transform } = require('stream');

const PORT = 3040;
let bufforStr = '';

const getListFiles = path => {
    return ['..'].concat(fs.readdirSync(path));
};

const isFile = (cPath, el) => {
    return fs.lstatSync(path.join(cPath, el)).isFile();
}

const getMenu = (list, currPath) => {
    let menu = '<ul>';
    for (let i = 0; i < list.length; i++) {
        let slash = '';
        try {
            slash = isFile(currPath, list[i]) ? '' : '/';
        } catch(e) {}
        menu += 
        `<li>
            <a href="${list[i]}${slash}">
                ${list[i]}${slash}
            </a>
        </li>`;
    }
    menu += '</ul>';
    
    return menu;
}

const getLocation = (url) => {
    let currPath = __dirname;
    let fileName = '';

    url.split('/')
        .filter((el => el)) // to delete empty elements
        .forEach((element, i, arr) => {
            if (arr.length == (i + 1)) {
                try {
                    if (isFile(currPath, element)) {
                        fileName = element;
                    } else {
                        currPath = path.join(currPath, element);
                    }
                } catch(e) {}
                
            } else {
                currPath = path.join(currPath, element);
            }
        });

    return { currPath, fileName };
}

const app = http.createServer((request, response) => {
    if (request.method === 'GET') {
        
        response.setHeader('Content-Type', 'text/html');

        const filePath = path.join(__dirname, 'index.html');

        readStream = fs.createReadStream(filePath);

        readStream.pipe(response);

    } else {
        response.end('Method Not Allowed');
    }
});

const socket = io(app);

let counter = 0;

socket.on('connection', (client) => {
    counter++;
    client.emit('NEW_QUANTITY_USERS', counter);
    client.broadcast.emit('NEW_QUANTITY_USERS', counter);

    const stream = ss.createStream();
    
    client.on('disconnect', () => {
        counter--;
        client.emit('NEW_QUANTITY_USERS', counter);
        client.broadcast.emit('NEW_QUANTITY_USERS', counter);
    });

    const charToStrCompilation = new Transform({
        transform(chunk, encoding, callback) {
            bufforStr += chunk;
                
            if (chunk == '\n') {
                this.push(bufforStr);
                bufforStr = '';
            }
    
            callback();
        }
    });

    let requestUrl = new URL(client.handshake.headers.referer).pathname;

    let { currPath, fileName } = getLocation(requestUrl);

    if (fileName) {
        const filePath = path.join(currPath, fileName);
        readStream = fs.createReadStream(filePath);
        ss(client).emit('FILE', stream);

        readStream.pipe(stream);
    } else {
        let list = getListFiles(currPath)
        let menu = getMenu(list, currPath);

        client.emit('INIT', { menu });
    }
});

app.listen(PORT, () => {
    console.log('The server is listening on '+`http://localhost:${PORT}/`.blue);
});
