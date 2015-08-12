//==================== NODE MODULES ====================//

var _ = require('underscore');
var flagger = require('flagger')();

//==================== SETUP ===========================//

var flag = flagger.print || flagger.p; // '-(-)print' takes precedence over '-(-)p'

//==================== FUNCTIONS =======================//

var matchKey = function (keys) {
    if (_.isString(keys)) return _.contains(flag, keys);
    return _.any(keys, function (key) {
        return _.contains(flag, key);
    });
};

var check = function (keyString) {
    return flag && (flag.length === 0 || matchKey(keyString));
};

//==================== EXPORTS =========================//

module.exports = {

    log: function (keyString) {
        if (check(keyString)) {
            const logArguments = Array.prototype.slice.call(arguments, 1);
            console.log.apply(console, logArguments);
        }
    }
};

