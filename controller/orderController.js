const db = require('../common/DB/DBServices');

function createOrder(order, callback) {
    console.log(order);
    if (order) {
        let orderid = 0;
        let transaction_id = 0;

        // Make order
        getOrderId(orderid => {
            orderid = orderid;
            getOrderId(transaction_id => {
                transaction_id = transaction_id;
                let sql_order = "insert into orders (order_id,transaction_id,customer_code,recipt_printed,paid,qtag,total,discount,tax,grandtotal,user_code) values ('" + orderid + "','" + transaction_id + "','" + order.customer.customer_code + "','" + order.recipt_printed + "','" + order.paid + "','" + order.qtag + "','" + order.total + "','" + order.discount + "','" + order.tax + "','" + order.grandtotal + "','" + order.user_code + "')";
                db.CreateQueryStr(sql_order, (err, rows) => {
                    if (rows) {
                        createOrderDetail(order, orderid, (err, rows) => {
                            if (rows) {
                                createTracking(orderid, (err, rows) => {
                                    console.log(err);
                                    if(rows){
                                        updateCashRecords(orderid, order, (err, rows) =>{
                                            if(rows) {
                                                UpdateQtag(order.qtag, (err, rows) => {
                                                    if (err) {
                                                        callback(err, rows);
                                                    } else {
                                                        callback(err, {
                                                            status: 'success'
                                                        });
                                                    }
                                                });
                                            }
                                        });
                                    }
                                });



                                        


                                



                            }
                        });

                    }
                });

            });
        });
    }
}

function createOrderDetail(order, orderid, callback) {
    order.items.forEach(food => {
        let sql_order_detail = "insert into order_details (order_id,food_id,quantity,total) values ('" + orderid + "','" + food.food.id + "','" + food.quantity + "','" + food.food.price * food.quantity + "')";
        db.CreateQueryStr(sql_order_detail, (err, rows) => {
            if (err) {
                console.log(err);
                callback(err, rows);
            }
        });
    });
    callback(null, 'OK');
}

function UpdateQtag(qTag, callback) {
    let sql = "update qtags set status=0 where tag=" + qTag;
    db.CreateQueryStr(sql, (err, rows) => {
        console.log("update Tag");
        callback(err, rows);
    });
}
function createTracking(order_id, callback){
    let sql = "insert into order_trackings (order_id,order_status,position) values ('" + order_id + "','IN PROGRESS','IN KITCHEN')";
    db.CreateQueryStr(sql, (err, rows) => {
        if(rows){
            console.log('tracking update');
            callback(err , rows);
        }
        
    });
}
function updateCashRecords(order_id, order , callback){
    let sql = "insert into order_cash_records (order_id,total,recieved,changeAmt) values ('" + order_id + "','" + order.grandtotal + "','" + order.recieved + "','" + order.change + "')"
    db.CreateQueryStr(sql, (err, rows) => {
        if(rows){
            console.log('Cash recorded');
            callback(err , rows);
        }
        
    });
}

function getOrderId(callback) {
    let sql = "select upper(md5(uuid())) as ids from dual";
    db.CreateQueryStr(sql, (err, orderid) => {
        console.log(orderid[0].ids);
        callback(orderid[0].ids);
    });
}

module.exports = {
    createOrder,
}