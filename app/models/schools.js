// The contents of individual model .js files will be concatenated into dist/models.js

(function() {

  // Protects views where angular is not loaded from errors
  if (typeof angular == 'undefined') {
    return;
  }


  var schoolModule = angular.module('SchoolModel', []);

  schoolModule.factory('SchoolData', function() {
    var exports = {};

    exports.schools = [
      {
        "id": 1,
        "name": "Abbeville"
      }, {
        "id": 3,
        "name": "Denham Springs"
      }, {
        "id": 4,
        "name": "BRCC"
      }, {
        "id": 9,
        "name": "NoWhere Ville"
      }
    ];

    exports.add = function(school){
      exports.schools.push(event);
    };

    return exports;

  });


})();