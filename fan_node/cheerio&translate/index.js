// TAST 1

const axios = require('axios');
const cheerio = require('cheerio');
const { request } = require('express');

axios.get('https://www.toramp.com/rating.php')
.then((response) => {
    var $ = cheerio.load(response.data); 
    
    $('.orig_title').each(function(i, element){
        if (i < 5) {
            console.log($(this).text());
        }
    });
}).catch((err) => {
    console.log(err);
});

// TAST 2

const express = require('express');

const app = express();

app.get('/api', (request, response) => {
    text = request.query['text'];
    language = request.query['language'];

    axios.post('https://api.itranslate.com/translate/v1', {
        "key": "83fcbf65-1d2c-4051-b37f-5935e8fc7768", 
        "source": {
            "dialect": "auto", "text": `${text}`
        },
        "target": {
            "dialect": `${language}`
        }
    })
    .then((responseITranslate) => {
        response.send(responseITranslate.data.target.text);
    })
    .catch(err => {
        console.log(err);
        response.send('Internal server error');
    });
});

app.listen(3000);