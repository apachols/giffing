/**
 * Using Rails-like standard naming convention for endpoints.
 * GET     /things              ->  index
 * POST    /things              ->  create
 * GET     /things/:id          ->  show
 * PUT     /things/:id          ->  update
 * DELETE  /things/:id          ->  destroy
 */

'use strict';

var _ = require('lodash');
var fs = require('fs');
var config = require('../../config/environment');

// Get list of things
exports.index = function(req, res) {

  var filenames = [];
  var files = fs.readdirSync( config.contentPath );

  for(var i in files) {
    if (!files.hasOwnProperty(i)) continue;
    var name = { name: files[i], info: 'suck it'};
    filenames.push(name);
  }

  res.json(filenames);
};