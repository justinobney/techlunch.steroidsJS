(->

  # Protects views where angular is not loaded from errors
  return  if typeof angular is "undefined"

  RootApp = angular.module("RootApp", [])

  RootApp.factory "NavigationService", ->
    exports = {}
    exports.navigate = (url) ->
      webView = undefined
      webView = new steroids.views.WebView("/views/" + url)
      steroids.layers.push webView
      steroids.drawers.hideAll()

    exports

)()