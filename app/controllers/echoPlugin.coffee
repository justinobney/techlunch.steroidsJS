# Echo plugin at
#   https://github.com/AppGyver/steroids-echo-plugin
#
# Information on including custom plugins to your Steroids project at
#   http://guides.appgyver.com/steroids/guides/cloud_services/plugin-config/

document.addEventListener "deviceready", ->
  angular.bootstrap document, ['echoApp']

echoApp = angular.module 'echoApp', ['hmTouchevents']

echoApp.controller 'IndexCtrl', ($scope)->
  
  $scope.echo = ->
    window.echo "echome", (result)->
      alert "Echo plugin works:" + (result is "echome") # should alert 'true'