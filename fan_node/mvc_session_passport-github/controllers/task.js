const models = require('../models');

exports.getTasks = (req, res, next) => {
    if (!req.session.username && !req.session.githubId) {
        res.redirect('/auth/login/');
    } else {
        models.Task.getTasks().then(tasks => {
            console.log(tasks);
            res.render('tasks', { tasks });
        });
    }
}

exports.createTask = (req, res, next) => {
    models.Task.createTask(req.body).then(data => {
        res.redirect('/task/');
    })
}

exports.updateTaskDescription = (req, res, next) => {
    models.Task.updateTask(req.params.taskId, req.body).then(data => {
        res.redirect('/task/');
    })
}

exports.completeTask = (req, res, next) => {
    models.Task.completeTask(req.params.taskId, req.body).then(data => {
        res.redirect('/task/');
    })
}

exports.assignTask = (req, res, next) => {

}

exports.deleteTask = (req, res, next) => {
    models.Task.deleteTask(req.params.taskId).then(data => {
        res.redirect('/task/');
    })
}
