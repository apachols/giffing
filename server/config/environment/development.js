'use strict';

// Development specific configuration
// ==================================
module.exports = {
  // MongoDB connection options
  mongo: {
    uri: 'mongodb://localhost/giffing-dev'
  },

  contentPath: './content',

  seedDB: true
};
