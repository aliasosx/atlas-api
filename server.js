var app = require('./common/app');
var userRouter = require('./routes/user.router');
var loginRouter = require('./routes/login.router');

var port = process.env.PORT || 5000;

app.use('/api/users', userRouter);
app.use('/api/login', loginRouter);

var server = app.listen(port, function () {
    console.log('Express server listening on port ' + port);
});