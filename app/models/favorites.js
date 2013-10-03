// The contents of individual model .js files will be concatenated into dist/models.js

(function() {

// Protects views where angular is not loaded from errors
if ( typeof angular == 'undefined' ) {
	return;
}


var favoritesModule = angular.module('FavoritesModel', []);

favoritesModule.factory('FavoritesData', function() {
  var exports = {};

  exports.favorites = [
    {
      id: 1,
      name: 'Abbeville'
    }, {
      id: 3,
      name: 'Denham Springs'
    }
  ];

  return exports;
});


})();
