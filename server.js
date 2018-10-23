var app = require('./common/app');
var userRouter = require('./routes/user.router');
var loginRouter = require('./routes/login.router');
var customerRouter = require('./routes/customer.router');
var foodRouter = require('./routes/food.router');
var saleRouter = require('./routes/sale.router');
var companyRouter = require('./routes/company.router');

var menus = require('./routes/menu.router');
var cors = require('cors');

var port = process.env.PORT || 5000;
app.use(cors());
app.use('/api/v1/users', userRouter);
app.use('/api/v1/login', loginRouter);
app.use('/api/v1/menus', menus);
app.use('/api/v1/customer', customerRouter);
app.use('/api/v1/foods', foodRouter);
app.use('/api/v1/sale', saleRouter);
app.use('/api/v1/companies', companyRouter);

var server = app.listen(port, function () {
    console.log('Atlas-api Server listening on port ' + port);
});