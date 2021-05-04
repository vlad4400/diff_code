const process = require('process');
const events = require('events');
const colors = require('colors');

const eventEmmiter = new events.EventEmitter();

const timerStatus = (dateStop, timerIdx, tempInterval) => {
    let dateNow = new Date(Date.now());
    let dateStr = '';
    let dTime = Math.floor((dateStop.getTime() - dateNow.getTime()) / 1000);
    let quntityYears = Math.floor(dTime / (12 * 30.4375 * 24 * 60 * 60));
    dTime = dTime % (12 * 30.4375 * 24 * 60 * 60);
    let quntityMonths = Math.floor(dTime / (30.4375 * 24 * 60 * 60));
    dTime = dTime % (30.4375 * 24 * 60 * 60);
    let quntityDays = Math.floor(dTime / (24 * 60 * 60));
    dTime = dTime % (24 * 60 * 60);
    let quntityHours = Math.floor(dTime /  (60 * 60));
    dTime = dTime % (60 * 60);
    let quntityMinutes = Math.floor(dTime / 60);
    dTime = dTime % 60;
    let quntitySeconds = dTime;

    if (quntityYears) {
        dateStr = (quntityYears == 1) ? ('1'.yellow + ' year'.blue) : `${quntityYears}`.yellow + ' years'.blue;
    }
    if (quntityMonths) {
        dateStr += (dateStr ? ' ' : '') 
            + ((quntityMonths == 1) ? '1'.yellow + ' month'.blue : `${quntityMonths}`.yellow + ' months'.blue);
    }
    if (quntityDays) {
        dateStr += (dateStr ? ' ' : '') 
            + ((quntityDays == 1) ? '1'.yellow + ' day'.blue : `${quntityDays}`.yellow + ' days'.blue);
    }
    if (quntityHours) {
        dateStr += (dateStr ? ' ' : '') 
            + ((quntityHours == 1) ? '1'.yellow + ' hour'.blue : `${quntityHours}`.yellow + ' hours'.blue);
    }
    if (quntityMinutes) {
        dateStr += (dateStr ? ' ' : '') 
            + ((quntityMinutes == 1) ? '1'.yellow + ' minute'.blue : `${quntityMinutes}`.yellow + ' minutes'.blue);
    }
    if (quntitySeconds) {
        dateStr += (dateStr ? ' ' : '') 
            + ((quntitySeconds == 1) ? '1'.yellow + ' second'.blue : `${quntitySeconds}`.yellow + ' seconds'.blue);
    }

    if (dateStr && dateNow.getTime() < dateStop.getTime()) {
        dateStr = dateStr.blue;
        console.log(`Timer ${timerIdx}: ${dateStr}`);
    } else {
        console.log(`Timer ${timerIdx} has ended!`.red);
        clearInterval(tempInterval);
    }
}

eventEmmiter.on('showTime', timerStatus);

for (let i = 2; i < process.argv.length; i++) {
    try {
        let timerIdx = i - 1;
        let time = (process.argv[i]).split('-');

        //TO CHECK INPUT DATA
        let err = false;
        time.forEach(el => {
            if (isNaN(el)) {
                err = true;
            }
        })
        if (err) {
            console.log(`Error input data for timer ${timerIdx}`.red);
            continue;
        }

        let date = new Date(Date.now());

        date.setFullYear(date.getFullYear() + parseInt(time[3]));
        date.setMonth(date.getMonth() + parseInt(time[2]));
        date.setDate(date.getDate() + parseInt(time[1]));
        date.setHours(date.getHours() + parseInt(time[0]));

        // to test how the timer is deleted: also add "0-0-0-0" to argv
        // date.setSeconds(date.getSeconds() + 5);

        console.log(`Timer ${timerIdx} start`.green);

        let tempInterval = setInterval(() => {
            eventEmmiter.emit('showTime', date, timerIdx, tempInterval);
        }, 1000);
    } catch(e) {
        console.log(e);
    }
}
