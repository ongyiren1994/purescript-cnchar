"use strict";

// Uncomment below when running `spago test` or `pulp test`
// var cnchar = require('cnchar');
// var poly = require('cnchar-poly');
// var order = require('cnchar-order');
// var trad = require('cnchar-trad');
// var radical = require('cnchar-radical');
// cnchar.use(poly, order, trad, radical);

exports.radical = function (word) {
    return cnchar.radical(word);
};

exports.radicalArray = function (word) {
    return cnchar.radical(word, 'array');
};

exports.radicalArray2 = function (word) {
    return cnchar.radical(word, 'array');
};