#!/usr/bin/env node

const io = require('socket.io');
const http = require('http');
const path = require('path');
const fs = require('fs');
const colors = require('colors');
const { Worker } = require('worker_threads');
const parse = require('url-parse');

const PORT = 3030;
let listUsers = [];
let listUsersDisconn = [];
const userIDSizeBytes = 4;

const app = http.createServer((request, response) => {
    if (request.method === 'GET') {
        
        const filePath = path.join(__dirname, 'index.html');

        readStream = fs.createReadStream(filePath);

        readStream.pipe(response);
    } else if (request.method === 'POST') {
        let data = '';

        request.on('data', chunk => {
            data += chunk;
        });

        request.on('end', () => {
            const parsedData = JSON.parse(data);
            console.log(parsedData);

            response.writeHead(200, { 'Content-Type': 'json'});
            response.end(data);
        });
    } else {
            response.statusCode = 405;
            response.end();
    }
});

const setUserID = userIDSizeBytes => {
    return new Promise((resolve, reject) => {
        const worker = new Worker('./worker.js', { workerData: userIDSizeBytes });

        worker.on('message', resolve);
        worker.on('error', reject);
    })
}

const socket = io(app);

socket.on('connection', function (client) {

    let userID;

    const initUser = (id, newUser) => {
        userID = id;
        listUsers.push(userID);

        client.emit('SET_USERID', userID);
    
        if (newUser) {
            console.log(`New connection [${userID}]`);
            client.broadcast.emit('NEW_CONN_EVENT', { msg: `The new client connected [${userID}]` });
    
        } else {
            console.log(`Reconnection [${userID}]`);
            client.broadcast.emit('NEW_CONN_EVENT', { msg: `Client reconnected [${userID}]` });
        }

        client.on('CLIENT_MSG', (data) => {
            client.broadcast.emit('SERVER_MSG', { msg: `[${userID}] ${data.msg}` });
            client.emit('SERVER_MSG', { msg: `[me] ${data.msg.split('').reverse().join('')}` });
        });
    
        client.on('disconnect', () => {

            listUsers = listUsers.filter(el => {
                return el != userID;
            });
    
            listUsersDisconn.push(userID);
            setTimeout(() => {
                listUsersDisconn = listUsersDisconn.filter(el => {
                    if (el == userID) {
                        client.broadcast.emit('NEW_CONN_EVENT', { msg: `Client disconnected [${userID}]` });
                        console.log(`Client disconnected [${userID}]`);

                        return false;
                    } else {
                        return true;
                    }
                });
            }, 5000);
        });
    }

    let r = client.handshake.headers.referer;
    let id = parse(r, true).query['id'];

    // check: 'id' is in 'listUsersDisconn' ?
    let inList = false;
    listUsersDisconn = listUsersDisconn.filter(el => {
        if (el == id) {
            inList = true;
            return false;
        } else {
            return true;
        }
    });
    
    if (inList) {
        initUser(id, false);
    } else {
        let quanAttempts = 10; //maximum quantity of attempts to get ID by one user

        (async () => {
            while (!userID && quanAttempts--) {
                await setUserID(userIDSizeBytes).then( res => {
                    if (!listUsers.includes(res.userID)) { 
                        initUser(res.userID, true);
                    }
                }).catch(e => console.log(e));
            }
            if (!userID) {
                client.emit('SERVER_ERROR');
            }
        })();
    }
});

app.listen(PORT, () => {
    console.log('The server is listening on '+`http://localhost:${PORT}/`.blue);
});

