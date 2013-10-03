(->

  # Listen for messages sent to our drawer example
  window.addEventListener "message", (msg)->
    if msg.data.action is "school/add-favorite"
      steroids.drawers.show(leftDrawer)

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