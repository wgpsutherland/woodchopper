//==================== NODE MODULES ====================//

var _ = require('underscore');

//==================== SETUP ===========================//

var args = process.argv.slice(2); // remove node path and file path
var printAllFlag = false;
var printFlag = false;

var flagIndex = _.findIndex(args, function (arg) {
    return arg === '--print' || arg === '-p';
});

if(flagIndex !== -1) { // if the --print flag is present

    args.splice(0, flagIndex + 1); // remove everything before the --print arguments

    var nonFlagIndex = _.findIndex(args, function (arg) { // find the next flag after --print
        return /^-/.test(arg);
    });

    if (nonFlagIndex !== -1) args.splice(nonFlagIndex, args.length - nonFlagIndex);

    if(args.length === 0) {
        printAllFlag = true;
    } else {
        printFlag = true;
    }
}

//==================== FUNCTIONS =======================//

var matchKey = function (keys) {
    if(_.isString(keys)) return _.contains(args, keys);
    return _.any(keys, function(key) {
        return _.contains(args, key);
    });
};

var check = function(keyString) {
    return printAllFlag || (printFlag && matchKey(keyString));
};

//==================== EXPORTS =========================//

module.exports.log = function (keyString, value) {
    if (check(keyString)) console.log(value);
};
