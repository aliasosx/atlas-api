const tokenModule = require('../../common/token_verify');

function verifyToken(token) {
    if (tokenModule.verify(token)) {
        return true;
    } else {
        return false;
    }
}

module.exports = {
    verifyToken,
}