document.addEventListener "deviceready", ->
  angular.bootstrap document, ['schoolsApp']

schoolsApp = angular.module 'schoolsApp', ['RootApp', 'SchoolModel', 'hmTouchevents']

schoolsApp.controller 'IndexCtrl', ($scope, NavigationService, SchoolData)->

  $scope.navigate = (url)->
    NavigationService.navigate url

  init = ()->
    steroids.view.navigationBar.show "Schools"
    $scope.schools = SchoolData.schools

  init()

schoolsApp.controller 'DetailCtrl', ($scope, SchoolData, MessageService)->

  schoolMap = {}

  $scope.toggleFavorite = (fav)->
    MessageService.publish "school/add-favorite", fav
    SchoolData.add fav

  init = ()->
    steroids.view.navigationBar.show "School Detail"
    SchoolData.schools.forEach (school)->
      schoolMap[school.id] = school
    $scope.school = schoolMap[steroids.view.params.id]

  init()