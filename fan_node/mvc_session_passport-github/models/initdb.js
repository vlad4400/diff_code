const config = require('../config');
const db = require('./db.js');

const Task = require('./task.js');
const User = require('./user');

module.exports = async function initDB() {
    await Task.init();
    await User.init();

    console.log('Database initialised');
}