"use strict";

// Uncomment below when running `spago test` or `pulp test`
// var cnchar = require('cnchar');
// var poly = require('cnchar-poly');
// var order = require('cnchar-order');
// var trad = require('cnchar-trad');
// cnchar.use(poly, order, trad);

exports.convertSimpleToTrad = function (word) {
    return cnchar.convert.simpleToTrad(word);
};

exports.convertSimpleToSpark = function (word) {
    return cnchar.convert.simpleToSpark(word);
};

exports.convertTradToSimple = function (word) {
    return cnchar.convert.tradToSimple(word);
};

exports.convertTradToSpark = function (word) {
    return cnchar.convert.tradToSpark(word);
};

exports.convertSparkToSimple = function (word) {
    return cnchar.convert.sparkToSimple(word);
};

exports.convertSparkToTrad = function (word) {
    return cnchar.convert.sparkToTrad(word);
};

