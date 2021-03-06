const bcrypt = require('bcrypt');
const DbServices = require('../DB/DBServices');
var tokenGen = require('../../common/token_verify');

function loginByEmail(user, callback) {
    let sql = "select * from users where email='" + user.email + "' and enabled=1";
    DbServices.CreateQueryStr(sql, function (err, rows) {
        if (err) {
            callback({
                status: "Login Fail"
            });
        } else if (rows == null) {
            console.log("rows null");
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
                    token: tokenGen.sign(rows[0].username + "|" + rows[0].email)
                });
            } else {
                callback({
                    status: "Login Fail"
                });
            }
        }
    });
}

function loginByUsername(user, callback) {
    let sql = "select * from users where username='" + user.username + "' and enabled=1";
    DbServices.CreateQueryStr(sql, function (err, rows) {
        if (err) {
            callback({
                status: "Login Fail"
            });
        } else if (rows == null) {
            console.log("rows null");
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
                    token: tokenGen.sign(rows[0].username + "|" + rows[0].email)
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

function decodeToken(token, callback) {
    callback(tokenGen.decode(token));
}

module.exports = {
    loginByEmail,
    verifyToken,
    decodeToken,
    loginByUsername,
}