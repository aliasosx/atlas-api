const db = require('../common/DB/DBServices');

function getFoods(callback) {
    let sql = "select * from foods";
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}

function addFoods(food, callback) {
    let sql = "insert into foods (food_name, photo, food_type_id, cost , price, currcode ) values ('" + food.food_name + "','" + food.photo + "','" + food.food_type_id + "','" + food.cost + "','" + food.price + "','" + food.currcode + "')";
    db.CreateQueryStr(sql, function (err, rows) {
        if (err) {
            callback(err, rows);
        } else {
            callback(err, rows);
        }
    });
}

function updateFood(food, callback) {
    let sql = "update foods set food_name = '" + food.food_name + "', photo = '" + food.photo + "', food_type_id = '" + food.food_type_id + "', cost = '" + food.cost + "', price = '" + food.price + "', currcode = '" + food.currcode + "' where id=" + food.id;
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}

module.exports = {
    getFoods,
    addFoods,
    updateFood,
}