"use strict";

// Uncomment below when running `spago test` or `pulp test`
// var cnchar = require('cnchar');
// var poly = require('cnchar-poly');
// var order = require('cnchar-order');
// var trad = require('cnchar-trad');
// var xhy = require('cnchar-xhy');
// cnchar.use(poly, order, trad, xhy);

exports._xhy = function (word) {
    return function (args) {
        return cnchar.xhy.apply(null, [word].concat(args));
    };
};
