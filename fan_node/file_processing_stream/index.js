const fs = require('fs');
const { Transform } = require('stream');
const process = require('process');

// INIT DATA
let bufforStr = '';
const srcFile = process.argv[2] ? process.argv[2] : 'test_access.log';
console.log(srcFile);
const listIP = [
    '89.123.1.41',
    '34.48.240.111'
];
// END INIT DATA

try {
    const readStream = fs.createReadStream(srcFile, { highWaterMark: 1, encoding: 'utf-8' });


    const charToStrCompilation = new Transform({
        transform(chunk, encoding, callback) {
            bufforStr += chunk;

            if (chunk == '\n') {
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

            fs.writeFile(`./${ip}_requests.log`, log, { flag: 'a' }, err => { 
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