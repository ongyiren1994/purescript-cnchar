"use strict";

// Uncomment below when running `spago test` or `pulp test`
// var cnchar = require('cnchar');
// var poly = require('cnchar-poly');
// var order = require('cnchar-order');
// var trad = require('cnchar-trad');
// cnchar.use(poly, order, trad);

exports._orderToWordArray = function (word) {
    return function (args) {
        return cnchar.orderToWord.apply(null, [word].concat(args).concat(['array']));
    }
};

exports._orderToWord = function (word) {
    return function (args) {
        return cnchar.orderToWord.apply(null, [word].concat(args));
    };
};