const db = require('../common/DB/DBServices');

function getInfo(company, callback) {
    if (company.id) {
        let sql = "select * from company_infos where id=" + company.id;
        db.CreateQueryStr(sql, function (err, rows) {
            callback(err, rows);
        });
    }
}

module.exports = {
    getInfo,
}