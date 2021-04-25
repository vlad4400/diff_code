exports.indexPage = (req, res, next) => {
    res.render('index', { 
        title: 'Task App', 
        message: 'Hello, World!' ,
        isAuth: (req.session.username || req.session.githubId) 
    });
}