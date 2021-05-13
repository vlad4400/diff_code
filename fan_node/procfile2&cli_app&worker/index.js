#!/usr/bin/env node
const fs = require('fs');
// const { Transform } = require('stream');
const process = require('process');
const inquirer = require('inquirer');
const path = require('path');
// const { join } = require('path');
const yargs = require('yargs');
const { Worker } = require('worker_threads');


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

            const makeProcessingFile = (fileName, currPath, listIP) => {
                return new Promise((resolve, reject) => {
                    const worker = new Worker('./worker.js', { 
                        workerData: { 
                            fileName,
                            currPath,
                            listIP
                        }
                    });
            
                    worker.on('message', resolve);
                    worker.on('error', reject);
                })
            }
            
            await makeProcessingFile(fileName, currPath, listIP);
            
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

