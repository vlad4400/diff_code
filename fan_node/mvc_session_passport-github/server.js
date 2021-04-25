const db = require('./models/db.js');
const initdb = require('./models/initdb.js');
initdb();

const express = require('express');
const colors = require('colors');
const path = require('path');

const app = express();

app.use(express.static(path.join(__dirname, 'public')));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const session = require('express-session');
const sessionStore = new (require('express-mysql-session')(session))({}, db);
const sessionMiddleware = session({
    store: sessionStore,
    secret: 'Some secret',
    resave: false,
    saveUninitialized: false,
    rolling: true,
    cookie: { maxAge: 600000 },
    secret: 'keyboard cat',
    saveUninitialized: false,
});

app.use(sessionMiddleware);

// const middlewares = require('./middlewares');
// app.use(middlewares.logSession);

const templating = require('consolidate');
const handlebars = require('handlebars');
templating.requires.handlebars = handlebars;

const registerHelpers = require('./views/helpers');
registerHelpers();

app.engine('hbs', templating.handlebars);
app.set('view engine', 'hbs');
app.set('views', path.join(__dirname, 'views'));

// pasport
var passport = require('passport');
var bodyParser = require('body-parser');
var methodOverride = require('method-override');
var GitHubStrategy = require('passport-github2').Strategy;
var partials = require('express-partials');

var GITHUB_CLIENT_ID = "cb98f941543af78622ce";
var GITHUB_CLIENT_SECRET = "bfc28a9c7522b97991887dee8d1a62081b386d86";

// Passport session setup.
passport.serializeUser(function(user, done) {
    done(null, user);
    // console.log('serialize');
});

passport.deserializeUser(function(obj, done) {
    done(null, obj);
    // console.log('deserialize');
});

// Use the GitHubStrategy within Passport.
passport.use(new GitHubStrategy(
    {
        clientID: GITHUB_CLIENT_ID,
        clientSecret: GITHUB_CLIENT_SECRET,
        callbackURL: "http://localhost:3000/auth/github/callback"
    },
    function(accessToken, refreshToken, profile, done) {
        // asynchronous verification, for effect...
        process.nextTick(function () {
            // console.log(profile);
            return done(null, profile);
        });
    }
));

// configure Express
app.use(partials());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(methodOverride());

app.use(passport.initialize());
app.use(passport.session());

// GET /auth/github
app.get('/auth/github',
    passport.authenticate('github', { scope: [ 'user:email' ] }),
    function(req, res){}
);

// GET /auth/github/callback
app.get('/auth/github/callback', 
    passport.authenticate('github', { failureRedirect: '/login' }),
    function(req, res) {
        console.log('sign up to github');

        res.redirect('/');
    }
);

const router = require('./routers');

app.use(router);

app.listen(3000, () => {
    console.log('The server is listening on '+'http://localhost:3000/'.blue);
});
