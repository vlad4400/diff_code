const express = require('express');
const middlewares = require('../middlewares');
const controllers = require('../controllers');

const router = express.Router();

router.use('/', middlewares.auth.tryFindUserByGithubId, controllers.main.indexPage);

module.exports = router;