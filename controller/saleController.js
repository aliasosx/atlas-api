const db = require('../common/DB/DBServices');
var dateTime = require('node-datetime');
var uniqueid = require('uniqid');

function create_sale(sale, callback) {
    var dt = dateTime.create();
    var formatted = dt.format('Y-m-d H:M:S');
    let transaction_id = uniqueid().toUpperCase() + uniqueid().toUpperCase();
    let order_id = uniqueid().toUpperCase() + uniqueid().toUpperCase();

    let sql = [
        "insert into sales (sale_date,food_id,transaction_id,quantity,price, discount_percentage,user_id) values ('" + formatted + "','" + sale.food_id + "','" + transaction_id + "','" + sale.quantity + "','" + sale.price + "','" + sale.discount_percentage + "','" + sale.user_id + "')",
        "insert into orders (order_id, transaction_id,order_date,customer_id,recipt_printed) values ('" + order_id + "', '" + transaction_id + "','" + sale.customer_id + "', 'false')"
    ];
    db.createQueryWithTransaction(sql, function (err, rows) {
        callback(err, rows);
    });
}
module.exports = {
    create_sale,
}