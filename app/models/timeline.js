// The contents of individual model .js files will be concatenated into dist/models.js

(function() {

  // Protects views where angular is not loaded from errors
  if (typeof angular == 'undefined') {
    return;
  }


  var timelineModule = angular.module('TimelineModel', []);

  timelineModule.factory('TimelineData', function() {
    var exports = {};

    exports.events = [
      {
        "id": 1,
        "sport": "Football",
        "date": "September 20, 2013 7:00 PM",
        "home": {
          "name": "Catholic - BR",
          "score": 34
        },
        "away": {
          "name": "Denham Springs",
          "score": 0
        },
        "url": "/views/share/index.html?id=1"
      }, {
        "id": 2,
        "sport": "Football",
        "date": "September 27, 2013 7:00 PM",
        "home": {
          "name": "Broadmoor",
          "score": null
        },
        "away": {
          "name": "Denham Springs",
          "score": null
        },
        "url": "/views/share/index.html?id=2"
      }, {
        "id": 3,
        "sport": "Basketball",
        "date": "September 19, 2013 7:00 PM",
        "home": {
          "name": "Catholic - BR",
          "score": 34
        },
        "away": {
          "name": "Denham Springs",
          "score": 55
        },
        "url": "/views/share/index.html?id=3"
      }, {
        "id": 1,
        "sport": "Football",
        "date": "September 20, 2013 7:00 PM",
        "home": {
          "name": "Catholic - BR",
          "score": 34
        },
        "away": {
          "name": "Denham Springs",
          "score": 0
        },
        "url": "/views/share/index.html?id=1"
      }
    ];

    exports.add = function(event){
      exports.events.push(event);
    };

    return exports;

  });


})();