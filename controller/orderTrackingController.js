const db = require('../common/DB/DBServices');

function getOrderTracks(callback) {
    const sql = "select orders.order_id, orders.grandtotal, orders.paid, orders.qtag,users.username,order_trackings.order_status,order_trackings.position,order_trackings.starttime,order_trackings.finishtime,order_trackings.done, customers.fullname from orders , order_trackings , users , customers where customers.customer_code = orders.customer_code and orders.order_id = order_trackings.order_id and orders.user_code = users.emp_id and order_trackings.done ='0' order by order_trackings.starttime,order_trackings.done asc";
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}

function updateOrderTrackDone(orderTrack, callback) {
    console.log(orderTrack);

    const sql = "update order_trackings set finishtime = '" + orderTrack.finishtime + "' , done=" + orderTrack.done + " , order_status='" + orderTrack.order_status + "' , position='" + orderTrack.position + "', emp_id='" + orderTrack.emp_id + "' where order_id='" + orderTrack.order_id + "'";
    const sql_qUpdate = "update qtags set status=1 where tag=" + orderTrack.qtag;
    db.CreateQueryStr(sql, function (err, rows) {
        if (err) {
            callback(err, rows);
        } else {
            db.CreateQueryStr(sql_qUpdate, function (err, rows) {
                callback(err, rows);
            });
        }
    });
}
function getOrderTrackingPending(callback) {
    let sql = "select  * from order_trackings , order_details, orders , foods where orders.order_id = order_trackings.order_id and orders.order_id = order_details.order_id and order_details.food_id = foods.id and done=0";
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}
module.exports = {
    getOrderTracks,
    updateOrderTrackDone,
    getOrderTrackingPending,
}