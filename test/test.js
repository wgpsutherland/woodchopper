var _ = require('underscore');
var chai = require('chai');
var expect = chai.expect;

var chop = require('../lib/index.js');

var list = [
    'blue',
    ['red'],
    ['blue', 'red'],
    ['important', 'red'],
    ['blue', 'security'],
    ['blue', 'security', 'red'],
    ['blue', 'red', 'security', 'pink'],
    ['blue', 'important', 'security', 'pink']
];

_.each(list, function(item) {
    chop.log(item, item.toString());
});

chop.log('blue', 'welcome to the world of the mighty %s', 'boosh');
