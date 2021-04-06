"use strict";

// Uncomment below when running `spago test` or `pulp test`
// var cnchar = require('cnchar');
// var poly = require('cnchar-poly');
// var order = require('cnchar-order');
// var trad = require('cnchar-trad');
// cnchar.use(poly, order, trad);

exports._spell = function (word) {
    return function (args) {
        return cnchar.spell.apply(null, [word].concat(args));
    };
};

exports._spellArray = function (word) {
    return function (args) {
        return cnchar.spell.apply(null, [word].concat(args).concat(['array']));
    };
};

exports._spellToWord = function (word) {
    return function (args) {
        return cnchar.spellToWord.apply(null, [word].concat(args));
    };
};

exports._spellToWordArray = function (word) {
    return function (args) {
        return cnchar.spellToWord.apply(null, [word].concat(args).concat(['array']));
    };
};

exports._strokeToWord = function (num) {
    return function (args) {
        return cnchar.strokeToWord.apply(null, [num].concat(args));
    }
};

exports._strokeToWordArray = function (num) {
    return function (args) {
        return cnchar.strokeToWord.apply(null, [num].concat(args).concat(['array']));
    }
};
