const { workerData, parentPort } = require('worker_threads');
const crypto = require('crypto');


const userID = crypto.randomBytes(workerData).toString('hex');

parentPort.postMessage({ userID });