const express = require('express');
const colors = require('colors');
const path = require('path');
const templating = require('consolidate');
const axios = require('axios');
const cheerio = require('cheerio');
const handlebars = require('handlebars');
const cookieParser = require('cookie-parser');

const app = express();


const listSites = [
    {
        name: 'toramp.com',
        url: 'https://www.toramp.com/rating.php',
        anchorName: '.orig_title',
    },
    {
        name: 'rottentomatoes.com',
        url: 'https://www.rottentomatoes.com/top/',
        anchorName: '.best-all-time+',
    },
    {
        name: 'filmpro.ru',
        url: 'https://www.filmpro.ru/series/selections/69400',
        anchorName: '.Title span',
    },
    {
        name: 'kinonews.ru',
        url: 'https://www2.bfi.org.uk/greatest-films-all-time',
        anchorName: '.wysiwyg h3 a',
    },
    {
        name: 'adme.ru',
        url: 'https://www.adme.ru/tvorchestvo-kino/22-seriala-s-vysokim-rejtingom-dlya-teh-kto-hochet-otdohnut-v-vyhodnye-1312215/',
        anchorName: '._2r__xiKDurulGZmkq4_dl p.adme-img-description',
    },
];
const defaultSite = 0;
const sizeLimits = 10;
const defaultSizeListFilms = 5;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());

app.engine('hbs', templating.handlebars);
app.set('view engine', 'hbs');
app.set('views', path.join(__dirname, 'views'));

handlebars.registerHelper('showSites', (listSites, selectedSite) => {
    let arrOptions = listSites.map(({ name }) => {
        return `<option value="${name}"${(selectedSite==name) ? 'selected' : ''}>${name}</option>`
    });
    let sel = '<select name="site-name" id="site-name">\n\t' +
            arrOptions.join('\n\t') + `\n` +
        '</select>\n';
    return sel;
});

handlebars.registerHelper('showLimits', (sizeLimits, limitSizeListFilms) => {
    let arrOptions = [];
    let sel = '';

    for (i = 1; i <= sizeLimits; i++) {
        arrOptions.push(`<option value="${i}"${(limitSizeListFilms==i) ? 'selected' : ''}>${i}</option>`)
    }

    sel = '<select name="list-limit" id="list-limit">\n\t' +
            arrOptions.join('\n\t') + `\n` +
        '</select>\n';

    return sel;
});

app.get('/', (req, res) => {
    try {
        let { siteName, sizeLimitFilmList } = req.cookies;

        if ( !siteName || !sizeLimitFilmList) {
            siteName = req.query['siteName'];
            sizeLimitFilmList = req.query['sizeLimitFilmList'];
        }
        
        if ( !siteName || !sizeLimitFilmList) {
            siteName = defaultSite;
            sizeLimitFilmList = defaultSizeListFilms;
        }

        if (req.cookies['siteName'] !== siteName) {
            res.cookie('siteName', siteName);
        }
        if (req.cookies['sizeLimitFilmList'] !== sizeLimitFilmList) {
            res.cookie('sizeLimitFilmList', sizeLimitFilmList);
        }

        res.render('home', { 
            listSites,
            selectedSite: siteName,
            isListFilms: false,
            listFilms: null,
            sizeLimits,
            limitSizeListFilms: sizeLimitFilmList,
        });
    }
    catch (e) {
        console.log(e);
        res.status(500).send();
    };
});

app.post('/', (req, res) => {
    let url;
    let anchorName;
    let limitSizeListFilms;

    listSites.forEach((obj) => {
        if (obj.name == req.body['site-name']) {
            url = obj.url;
            anchorName = obj.anchorName;
        } 
    });

    if (req.body['list-limit']) {
        limitSizeListFilms = req.body['list-limit'];
    } else {
        limitSizeListFilms = defaultSizeListFilms;
    }

    if (req.cookies['siteName'] !== req.body['site-name']) {
        res.cookie('siteName', req.body['site-name']);
    }
    if (req.cookies['sizeLimitFilmList'] !== limitSizeListFilms) {
        res.cookie('sizeLimitFilmList', limitSizeListFilms);
    }

    axios.get(url)
    .then((response) => {
        let $ = cheerio.load(response.data);

        let listFilms = [];
        let isListFilms = false;

        $(anchorName).each(function(i, element){
            if (i < limitSizeListFilms) {
                listFilms.push($(this).text());
                isListFilms = true;
            }
        });

        res.render('home', { 
            listSites,
            selectedSite: req.body['site-name'],
            isListFilms: true,
            listFilms,
            sizeLimits,
            limitSizeListFilms,
        });
    })
    .catch(err => {
        console.log(err);
        res.status(500).send();
    });
});

app.listen(3000, () => {
    console.log('The server is listening on '+'http://localhost:3000/'.blue);
});
