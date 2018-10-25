const db = require('../common/DB/DBServices');

function getMenus(callback) {
    let sql = "select * from menus where enabled = 1"
    db.CreateQueryStr(sql, function (err, rows) {

        callback(err, rows);
    });
}

function getMenuByToken(user, callback) {
    let sql = "select  mnu.id, mnu.menu_name, mnu.menu_link, mnu.menu_icon from menus mnu , users usr , roles rl , tranx_role_menu trr where usr.role_code = rl.role_code and rl.role_code = trr.role_code and mnu.id = trr.menu_id and usr.username = '" + user + "'"
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}

module.exports = {
    getMenus,
    getMenuByToken,
}