document.addEventListener "deviceready", ->
  angular.bootstrap document, ['mainApp']

mainApp = angular.module 'mainApp', ['RootApp', 'TimelineModel', 'FavoritesModel', 'hmTouchevents']

mainApp.controller 'IndexCtrl', ($scope, $timeout, TimelineData, FavoritesData)->

  $scope.add = ()->
    data =
      id: 1
      sport: "Basketball"
      date: "September 11, 2013 7:00 PM"
      home:
        name: "Catholic - BR"
        score: 34
      away:
        name: "Denham Springs"
        score: 9999
      url: "/views/share/index.html?id=1"

    TimelineData.add data

  init = ()->
    steroids.view.navigationBar.show "Main App Page"
    $scope.timelineEvents = TimelineData.events # ('timeline').getList()

  init()

mainApp.controller 'DrawerCtrl', ($scope, NavigationService, FavoritesData)->

  $scope.navigate = (url)->
    NavigationService.navigate url

  init = ()->
    $scope.favorites = FavoritesData.favorites

    # Listen for messages sent to our drawer example
    window.addEventListener "message", (msg)->
      if msg.data.action is "school/add-favorite"
        $scope.$apply ()->
          FavoritesData.add msg.data.fav
          $scope.favorites = FavoritesData.favorites

  init()

mainApp.controller 'DisabledCtrl', ($scope)->

  $scope.close = ()->
    steroids.modal.hide()