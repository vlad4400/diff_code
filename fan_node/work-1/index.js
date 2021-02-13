/*** TAST 1 ******************************************************/

var colors = require('colors');
var colorsSafe = require('colors/safe');

console.log('It\'s a blue color!'.blue);

colors.setTheme({
    warn: 'yellow',
    error: 'red'
});

colorsSafe.setTheme({
    warn: 'yellow',
    error: 'red'
});

console.log('It\'s is a warning'.warn);
console.log(colorsSafe.warn('It\'s is a warning (Safe)'));

console.log('It\'s is a error'.error);
console.log(colorsSafe.error('It\'s is a error (Safe)'));


/*** TAST 2 ******************************************************/

const beeper = require('beeper');

async function beep() {

	await beeper(3);
	// beep three times

	await beeper('****-*-*');
	// beep, beep, beep, beep, pause, beep, pause, beep
};

beep();