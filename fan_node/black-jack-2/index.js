var readline = require('readline');
var log4js = require("log4js");
var fs = require('fs');
var colors = require('colors');
const { groupEnd } = require('console');

const FILE_NAME = process.argv[2] || 'game.log';
var logger;
var dealer;
var player;

function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function getCard() {
    var cards = ['6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'];
    return cards[getRandomInt(0, cards.length - 1)];
}

function getSum(arr) {
    var sum = 0;
    for (var i = 0; i < arr.length; i++) {
        switch (arr[i]) {
        case '6':
        case '7':
        case '8':
        case '9':
        case '10':
            sum += parseInt(arr[i]);
            break;
        case 'J':
        case 'Q':
        case 'K':
            sum += 10;
            break;
        }
    }
    for (var i = 0; i < arr.length; i++) {
        if (arr[i] == 'A') {
            (sum > 10) ? ++sum : sum += 11;
        }
    }
    return sum;
}

function getStatusUser() {
    getStatus();
    return 'Your cards: ' + player.join(', ') + '.';
}

function getStatus() {
    logger.trace('Dealer: ' + dealer.join(', ') + '. Player: ' + player.join(', ') + '.');
    return 'Dealer: ' + dealer.join(', ') + '. Player: ' + player.join(', ') + '.';
}

function doBegin() {
    log4js.configure({
        appenders: { gameLogs: { type: "file", filename: FILE_NAME } },
        categories: { default: { appenders: ["gameLogs"], level: "trace" } }
    });

    logger = log4js.getLogger("gameLogs");
    logger.trace("#Begin game#");

    dealer = [getCard()];
    player = [getCard(), getCard()];
}

function doWinner(mess = '') {
    console.log('You winner. '.green + mess + ((mess == '') ? '' : '! ') + getStatus());
    logger.trace('#User won#');
    doEnd();
}

function doLost(mess = '') {
    console.log('You lost the game. '.red + mess + ((mess == '') ? '' : '. ') + getStatus());
    logger.trace('#User lost#');
    doEnd();
}

function doStandoff() {
    console.log('The result of the game is a draw. '.blue + getStatus());
    logger.trace('#Standoff#');
    doEnd();
}

function doEnd() {
    logger.trace('#Game over#');
    showStatistics(FILE_NAME);
}

function showStatistics(fileName) {
    fs.readFile(fileName, function (err, data) {
        if (!err) {
            let quantityGames = 0;
            let quantityWins = 0;
            let quantityLosses = 0;
            let maxWins = 0;
            let maxLosses = 0;

            let previousGameResult = '';
            let quantityIdentical = 1;
            
            data.toString().split('#').forEach(element => {
                switch (element) {
                    case 'User won':
                        quantityGames++;
                        quantityWins++;
                        if (element === previousGameResult) {
                            quantityIdentical++;
                            if (quantityIdentical > maxWins) {
                                maxWins = quantityIdentical;
                            }
                        } else {
                            quantityIdentical = 1;
                        }
                        previousGameResult = element;
                        break;
                    case 'User lost':
                        quantityGames++;
                        quantityLosses++;
                        if (element === previousGameResult) {
                            quantityIdentical++;
                            if (quantityIdentical > maxLosses) {
                                maxLosses = quantityIdentical;
                            }
                        } else {
                            quantityIdentical = 1;
                        }
                        previousGameResult = element;
                        break;
                    case 'Standoff':
                        quantityGames++;
                        quantityIdentical = 1;
                        previousGameResult = element;
                        break;
                }
            });
            
            console.log();
            console.log(`Quantity games: ${quantityGames}`.cyan);
            console.log(`Quantity wins: ${quantityWins}`.cyan);
            console.log(`Quantity losses: ${quantityLosses}`.cyan);
            console.log(`Ratio of winnings to losses: ${quantityWins / quantityLosses}`.cyan);
            console.log(`Number of wins in a row: ${maxWins}`.cyan);
            console.log(`Number of losses in a row: ${maxLosses}`.cyan);

        } else {
            console.log();
            console.log('Statistics unavailable');
        }
    });
}

doBegin();

if (getSum(player) == 21) {
    doWinner('Black Jack');
}
else {
    console.log(getStatusUser() + ' Want another card?'.yellow + ' (1 - yes, 2 - no)');
    
    var gameOver = false;

    var rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    rl.on('line', function (answer) {

        if (answer == '1') {
            logger.trace('User takes card');
            player.push(getCard());
            sum = getSum(player);
            if (sum == 21) {
                doWinner('Black Jack');
                gameOver = true;
            }
            if (sum > 21) {
                doLost('You have more than 21 points');
                gameOver = true
            }
        }
        else if (answer == '2'){
            while (getSum(dealer) < 17) {
                logger.trace('Diller takes card');
                dealer.push(getCard());
            }
            var sumDealer = getSum(dealer);
            var sumPlayer = getSum(player);
            if (sumDealer == 21) {
                doLost('Dealer has Black Jack');
            }
            else if (sumDealer > 21) {
                doWinner('Dealer has more than 21 points');
            }
            else if (sumDealer == sumPlayer) {
                doStandoff();
            }
            else if (sumPlayer > sumDealer) {
                doWinner('You have more points than dealer')
            }
            else {
                doLost('Dealer has more points then you')
            }
        }

        if (answer === '2' || gameOver) {
            rl.close();
        } else {
            console.log(getStatusUser() + ' Want another card?'.yellow + ' (1 - yes, 2 - no)');
        }
    });
}

