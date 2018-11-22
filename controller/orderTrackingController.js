const db = require('../common/DB/DBServices');

function getOrderTracks(callback) {
    const sql = "select orders.order_id, orders.grandtotal, orders.paid, orders.qtag,users.username,order_trackings.order_status,order_trackings.position,order_trackings.starttime,order_trackings.finishtime,order_trackings.done, customers.fullname from orders , order_trackings , users , customers where customers.customer_code = orders.customer_code and orders.order_id = order_trackings.order_id and orders.user_code = users.emp_id order by order_trackings.starttime asc";
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}

function updateOrderTrack() {

}
module.exports = {
    getOrderTracks,
}