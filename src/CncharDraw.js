"use strict";

// Uncomment below when running `spago test` or `pulp test`
// var draw = require('cnchar-draw');
// cnchar.use(draw);

exports._draw = function (word) {
    return function (option) {
        return function () {
            cnchar.draw(word, option);
        };
    };
};