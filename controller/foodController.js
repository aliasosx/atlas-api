const db = require('../common/DB/DBServices');

function getFoods(callback) {
    //let sql = "select f.id,f.food_name,f.photo, f.cost, f.price, f.enabled, ft.food_type_desc_la, cc.curr_name_la,ks.kitchen_name,ks.kitchen_code from foods f , food_types ft , currency_code cc , kitchens ks where f.food_type_id = ft.id and cc.curr_code = f.currcode and f.kid = ks.id";
    let sql = "select f.id,f.food_name,f.photo, f.enabled, ft.food_type_desc_la, cc.curr_name_la,ks.kitchen_name,ks.kitchen_code, f.enabled_subtype, f.cost, f.price from foods f , food_types ft , currency_code cc , kitchens ks where f.food_type_id = ft.id and cc.curr_code = f.currcode and f.kid = ks.id and f.master_food_id=0";
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}

function addFoods(food, callback) {
    console.log(food);
    let sql = "insert into foods (food_name, photo, food_type_id, cost , price, kid ,currcode, created_by ) values ('" + food.food_name + "','" + food.photo + "','" + food.food_type_id + "','" + food.cost + "','" + food.price + "','" + food.kid + "','" + food.currcode + "','" + food.created_by + "')";
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

function getFoodsById(id, callback) {
    let sql = "select * from foods where id=" + id;
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}

function removeFoodById(food, callback) {
    let sql = "delete from foods where id=" + food.id;
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}

function getFoodByCate(catid, callback) {
    let sql = "select * from foods where master_food_id=0 and food_type_id=" + catid;
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}
function activateFood(food, callback) {
    const sql = "update food set enabled=" + food.enabled + " where id=" + food.id;
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}

function getSubFoodByFoodId(id, callback) {
    let sql = "select  * from foods where enabled_subtype = 2 and master_food_id = " + id;
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}

module.exports = {
    getFoods,
    addFoods,
    updateFood,
    getFoodsById,
    removeFoodById,
    getFoodByCate,
    activateFood,
    getSubFoodByFoodId,
}