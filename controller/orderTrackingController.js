const db = require('../common/DB/DBServices');

function getOrderTracks(callback) {
    const sql = "select orders.order_id, orders.grandtotal, orders.paid, orders.qtag,users.username,order_trackings.order_status,order_trackings.position,order_trackings.starttime,order_trackings.finishtime,order_trackings.done, customers.fullname from orders , order_trackings , users , customers where customers.customer_code = orders.customer_code and orders.order_id = order_trackings.order_id and orders.user_code = users.emp_id order by order_trackings.starttime,order_trackings.done asc";
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}

function updateOrderTrackDone(orderTrack, callback) {
    console.log(orderTrack);

    const sql = "update order_trackings set finishtime = '" + orderTrack.finishtime + "' , done=" + orderTrack.done + " , order_status='" + orderTrack.order_status + "' , position='" + orderTrack.position + "' where order_id='" + orderTrack.order_id + "'";
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });

}
module.exports = {
    getOrderTracks,
    updateOrderTrackDone,
}