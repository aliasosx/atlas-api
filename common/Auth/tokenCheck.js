const tokenModule = require('../../common/token_verify');

function verifyToken(token) {
    if (tokenModule.verify(token)) {
        return true;
    } else {
        return false;
    }
}
function decode(token){
    if(tokenModule.verify(token)){
        return tokenModule.decode(token);
    } else {
        return ;
    }
}

module.exports = {
    verifyToken,
    decode,
}