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
function menuByUser(user, menu_link, callback) {
    let sql = "select menus.menu_link from users , tranx_role_menu , menus where users.role_code = tranx_role_menu.role_code and menus.id = tranx_role_menu.menu_id and users.username = " + user + " and menus.menu_link='" + menu_link + "'";
    db.CreateQueryStr(sql, function (err, rows) {
        callback(err, rows);
    });
}

module.exports = {
    getMenus,
    getMenuByToken,
    menuByUser,
}