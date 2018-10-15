var header_req = require('../common/header');

module.exports = {
    tokenCheck: (html_header) => {
        return header_req.tokenVerification.verifyToken(html_header.authorization.replace("Bearer ", ""));
    }
}