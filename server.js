var app = require('./common/app');
var userRouter = require('./routes/user.router');
var loginRouter = require('./routes/login.router');
var menus = require('./routes/menu.router');


var port = process.env.PORT || 5000;

app.use('/api/v1/users', userRouter);
app.use('/api/v1/login', loginRouter);
app.use('/api/v1/menus', menus);

var server = app.listen(port, function () {
    console.log('Atlas-api Server listening on port ' + port);
});