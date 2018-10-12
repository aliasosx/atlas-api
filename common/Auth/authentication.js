const bcrypt = require('bcrypt');
const DbServices = require('../DB/DBServices');
var tokenGen = require('../../common/token_verify');

function loginByEmail(user, callback) {
    let sql = "select * from users where email='" + user.email + "'";
    DbServices.CreateQueryStr(sql, function (err, rows) {
        if (err) {
            callback({
                status: "Login Fail"
            });
        } else if (rows == null) {
            callback({
                status: "Login Fail"
            });
        } else if (Object.keys(rows).length == 0) {
            callback({
                status: "Login Fail"
            });
        } else if (Object.keys(rows).length > 0) {
            console.log(rows);
            if (bcrypt.compareSync(user.password, rows[0].password)) {
                callback({
                    status: "Success",
                    token: tokenGen.sign(rows[0].username + rows[0].email)
                });
            } else {
                callback({
                    status: "Login Fail"
                });
            }
        }
    });
}

function verifyToken(token, callback) {
    callback(tokenGen.verify(token));
}

module.exports = {
    loginByEmail,
    verifyToken,
}