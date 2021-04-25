const express = require('express');

const authRouter = require('./auth.js');
const mainRouter = require('./main.js');
const userRouter = require('./user.js');
const taskRouter = require('./task.js');

const router = express.Router();

router.use('/auth', authRouter);
router.use('/task', taskRouter);
router.use('/user', userRouter);
router.use(mainRouter);

module.exports = router;