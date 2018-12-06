var app = require('./common/app');
var userRouter = require('./routes/user.router');
var loginRouter = require('./routes/login.router');
const crypto = require('crypto');
var fs = require('fs');
var https = require('https');


var routerAtlas = require('./routes/atlas.router');

var cors = require('cors');

var port = process.env.PORT || 5000;
app.use(cors());

app.use('/api/v1/login', loginRouter);
app.use('/api/v1/users', userRouter);
app.use('/api/v1', routerAtlas);

/*
var server = app.listen(port, function () {
    console.log('Atlas-api Server listening on port ' + port);
});
*/

https.createServer({
    key: fs.readFileSync('ssl/server.key'),
    cert: fs.readFileSync('ssl/server.cert')
}, app).listen(port, () => {
    console.log('Atlas-api Server listening on port ' + port);
});
