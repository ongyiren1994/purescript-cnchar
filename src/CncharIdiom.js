"use strict";

// Uncomment below when running `spago test` or `pulp test`
// var cnchar = require('cnchar');
// var poly = require('cnchar-poly');
// var order = require('cnchar-order');
// var trad = require('cnchar-trad');
// var idiom = require('cnchar-idiom');
// cnchar.use(poly, order, trad, idiom);

exports._idiom = function (word) {
    return function (args) {
        return cnchar.idiom.apply(null, [word].concat(args));
    };
};

exports._idiomArray = function (word) {
    return function (args) {
        return cnchar.idiom.apply(null, word.concat(args).concat(['array']));
    };
};

