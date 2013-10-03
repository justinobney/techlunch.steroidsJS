document.addEventListener "deviceready", ->
  angular.bootstrap document, ['schoolsApp']

schoolsApp = angular.module 'schoolsApp', ['SchoolModel', 'hmTouchevents']

schoolsApp.controller 'IndexCtrl', ($scope, NavigationService, SchoolData)->

  $scope.toggleFavorite = (fav)->
    msg =
      fav: fav
      from: "schools"

    window.postMessage msg, "*"

  init = ()->
    steroids.view.navigationBar.show "Schools"
    $scope.schools = SchoolData.schools

  init()