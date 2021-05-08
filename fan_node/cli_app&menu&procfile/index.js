#!/usr/bin/env node

const fs = require('fs');
const { Transform } = require('stream');
const process = require('process');
const inquirer = require('inquirer');
const path = require('path');
const { join } = require('path');
const yargs = require('yargs');

// INIT DATA
const options = yargs
    .usage("Usage: -t <template string>")
    .option("t", { 
        alias: "template", 
        describe: "Template string for search",
        type: "string",
    })
    .argv;
    
if (options.template) {
    var listIP = [options.template];
} else {
    var listIP = [
        '89.123.1.41',
        '34.48.240.111'
    ];
}
let currPath = process.cwd();

// END INIT DATA

const makeProcessingFile = (fileName, currPath, listIP) => {
    try {
        const srcFile = path.join(currPath, fileName);
        let bufforStr = '';

        const readStream = fs.createReadStream(srcFile, { highWaterMark: 1, encoding: 'utf-8' });
    
    
        const charToStrCompilation = new Transform({
            transform(chunk, encoding, callback) {
                bufforStr += chunk;
    
                if (chunk == '\n' || chunk == '\r') {
                    if (bufforStr != '\n') {
                        this.push(bufforStr);
                    }
                    bufforStr = '';
                }
    
                callback();
            }
        });
    
        const writeLogByIp = (log, ip) => {
            if (log.indexOf(ip) != -1) {
                log = log.toString('utf8').replace(new RegExp(`${ip} - - `, 'g'), '');
    
                // console.log(regExp); // //for debag
                // console.log(log); // //for debag
    
                fs.writeFile(path.join(currPath, `./${ip}_requests.log`), log, { flag: 'a' }, err => { 
                    if (err) {
                        console.log(err);
                    }
                });
            }
        }
    
        const writeStrToFiles = new Transform({
            transform(chunk, encoding, callback) {
                for (let i = 0; i < listIP.length; i++) {
                    writeLogByIp(chunk, listIP[i]);
                }
    
                callback();
            }
        });
    
        // PROGRAM START
        // clear old files
        for (let i = 0; i < listIP.length; i++) {
            let fileName = `${listIP[i]}_requests.log`;
            fs.unlink(fileName, function(err){
                // if(err) return console.log(err); //for debag
                // console.log(`file ${fileName} deleted successfully`); // for debag
            });
        }
    
        readStream.pipe(charToStrCompilation).pipe(writeStrToFiles);
    
        readStream.on('end', () => {
            console.log('The program is finished')
        });
    
        // PROGRAMM END
    
    } catch(e) {
        console.log(e);
    }
}

const getListFiles = path => {
    return ['..'].concat(fs.readdirSync(path));
};

const showMenu = (list) => new Promise(resolve => {
    inquirer
        .prompt([{
            name: 'fileName',
            type: 'list',
            message: 'Choose file: ',
            choices: list,
        }])
        .then( answer => {
            resolve({
                isFile: fs.lstatSync(path.join(currPath, answer.fileName)).isFile(), 
                fileName: answer.fileName
            });
        });
});


(async () => {
    while (true) {
        const {isFile, fileName} = await showMenu(getListFiles(currPath));
        if (isFile) { 
            
            makeProcessingFile(fileName, currPath, listIP);
            
            // for debag
            // console.log('show content of file');
            // fs.readFile(path.join(currPath, fileName), 'utf8', (err, data) => {
            //     console.log(data);
            // });
            
            break;
        } else {
            currPath = path.join(currPath, fileName);
        }
    }
})();

