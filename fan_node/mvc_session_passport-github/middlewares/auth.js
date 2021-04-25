
const Cookies = require("cookies");
const passport = require('passport');
const models = require('../models');

exports.saveUserNameToCookie = (req, res, next) => {
    var cookies = new Cookies(req, res);

    cookies.set('username', req.body.username);
    next();
}

exports.loadUserNameFromCookie = (req, res, next) => {
    var cookies = new Cookies(req, res);

    req.body.username = cookies.get("username");
    next();
}

exports.github = (req, res, next) => {
    passport.authenticate('github', { scope: [ 'user:email' ] });
}

exports.githubCallback = (req, res, next) => {
    passport.authenticate('github', { failureRedirect: '/auth/login/' });
}

exports.ensureAuthenticated = (req, res, next) => {
    if (req.isAuthenticated()) { 
        return next();
    }
    res.redirect('/auth/login/');
}

exports.tryFindUserByGithubId = (req, res, next) => {
    if (!req.session.githubId && req.isAuthenticated()) {
        try {
            if (req.session.passport.user.id) {
                const user = models.User.findUserByGithubId(req.session.passport.user.id).then(([user, fieldData]) => {
                    if (user.length>0) {
                        user = user[0];
                        req.session.githubId = user.github_id;
                    }
                    next();
                })
            } else {
                next();
            }
        } catch(e) {
            console.log(e);
            next();
        }
    } else {
        next();
    }
}