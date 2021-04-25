const express = require('express');
const controllers = require('../controllers');
const middlewares = require('../middlewares');

const router = express.Router();

router.get('/', middlewares.auth.tryFindUserByGithubId, controllers.task.getTasks);
router.post('/', controllers.task.createTask);
router.post('/:taskId/description/', controllers.task.updateTaskDescription);
router.post('/:taskId/complete/', controllers.task.completeTask);
router.post('/:taskId/assign/', controllers.task.assignTask);
router.post('/:taskId/delete/', controllers.task.deleteTask);

module.exports = router;