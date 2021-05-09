#!/usr/bin/env node

const http = require('http');
const path = require('path');
const fs = require('fs');
const colors = require('colors');

const PORT = 3020;

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

http.createServer((request, response) => {
    if (request.method === 'GET') {
        response.setHeader('Content-Type', 'text/html');

        let { currPath, fileName } = getLocation(request.url);

        if (fileName) {
            const filePath = path.join(currPath, fileName);
            readStream = fs.createReadStream(filePath);
            readStream.pipe(response);
        } else {
            let list = getListFiles(currPath)
            let output = getMenu(list, currPath);
            response.end(output);
        }
    } else {
        response.end('Method Not Allowed');
    }
}).listen(PORT, () => {
    console.log('The server is listening on '+`http://localhost:${PORT}/`.blue);
});