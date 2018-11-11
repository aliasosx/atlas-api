const db = require('../common/DB/DBServices');

function getDiscounts(callback) {
    let sql = "select ds.id, fd.food_name,ds.discount_percentage, ds.created_at, ds.valid_until,ds.status from discounts ds , foods fd where ds.food_id = fd.id";
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}

function deleteDiscount(id, callback) {
    let sql = "delete from discounts where id=" + id;
    db.CreateQueryStr(sql, function (err, rows) {
        console.log(err);
        callback(err, rows);
    });
}

function createDiscount(discount, callback) {
    let sql = "insert into discounts (food_id, discount_percentage, valid_until, status) values (" + discount.food_id + ", '" + discount.discount_percentage + "','" + discount.valid_until + "','" + discount.status + "')";
    db.CreateQueryStr(sql, function (err, rows) {
        console.log(err);
        callback(err, rows);
    });
}

function getFoodByDiscount(callback) {
    let sql = "select * from foods where  id not in (select food_id from discounts)";
    db.CreateQueryStr(sql, function (err, rows) {
        console.log(err);
        callback(err, rows);
    });
}
module.exports = {
    getDiscounts,
    deleteDiscount,
    createDiscount,
    getFoodByDiscount,
}