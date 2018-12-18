const db = require('../common/DB/DBServices');

function getReportByCat(callback) {

    let sql = "select food_type_desc_la,count(*) cnt from foods , food_types where foods.food_type_id = food_types.id group by food_type_desc_la order by  cnt desc";
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });

}
function getReportRevByKitchen(callback) {
    let sql = "select kitchen_name,count(*) cnt ,sum(order_details.total)  sm from orders , order_details, foods , kitchens where orders.order_id = order_details.order_id and foods.id = order_details.food_id and foods.kid = kitchens.id and date(orders.order_date) = date(now()) group by kitchen_name order by sm desc";
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}

module.exports = {
    getReportByCat,
    getReportRevByKitchen,
}