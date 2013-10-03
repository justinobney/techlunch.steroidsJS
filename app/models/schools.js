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
        "name": "Abbeville",
        "url": "/views/school/index.html?id=1"
      }, {
        "id": 3,
        "name": "Denham Springs",
        "url": "/views/school/index.html?id=3"
      }, {
        "id": 4,
        "name": "BRCC",
        "url": "/views/school/index.html?id=4"
      }, {
        "id": 9,
        "name": "NoWhere Ville",
        "url": "/views/school/index.html?id=9"
      }
    ];

    exports.add = function(school){
      exports.schools.push(event);
    };

    return exports;

  });


})();