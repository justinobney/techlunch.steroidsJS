document.addEventListener "deviceready", ->
  angular.bootstrap document, ['mainApp']

mainApp = angular.module 'mainApp', ['TimelineModel', 'FavoritesModel', 'hmTouchevents']

mainApp.controller 'IndexCtrl', ($scope, TimelineRestangular)->

  # Listen for messages sent to our drawer example
  window.addEventListener "message", (msg)->
    if msg.data.exampleName is "drawer"
      $scope.selectedInDrawer = msg.data.selection
      $scope.$apply()

  # Initialize the left drawer
  leftDrawer = new steroids.views.WebView("/views/main/drawer.html")

  # Ensure that we only ever preload one drawer
  leftDrawer.preload( {id: "leftDrawer"},
    onFailure: (msg)->
      if msg.errorDescription is "A preloaded layer with this identifier already exists"
        console.log "Drawer already preloaded."
        # We know that preloading failed because there is a view that is already preloaded with this id.
        # Thus, we can force our WebView object to point to the preloaded layer.
        leftDrawer.id = "leftDrawer"
      else
        alert msg.errorDescription # something else went wrong
    onSuccess: ()->
      steroids.drawers.enableGesture leftDrawer
  )

  init = ()->
    steroids.view.navigationBar.show "Main App Page"
    $scope.timelineEvents = TimelineRestangular.all('timeline').getList()

  init()

mainApp.controller 'DrawerCtrl', ($scope, FavoritesRestangular)->

  $scope.sendMessage = (selection)->
    msg =
      selection: selection
      exampleName: "drawer"
    window.postMessage(msg, "*")

  # Helper function for opening new webviews
  $scope.navigate = (url)->
    webView = new steroids.views.WebView "/views/" + url
    steroids.layers.push webView
    steroids.drawers.hideAll()
    # steroids.modal.show(disabledView)

  # Fetch all objects from the local JSON (see app/models/cordovaExample.js)
  $scope.favorites = FavoritesRestangular.all('favorites').getList()

mainApp.controller 'DisabledCtrl', ($scope)->

  $scope.close = ()->
    steroids.modal.hide()