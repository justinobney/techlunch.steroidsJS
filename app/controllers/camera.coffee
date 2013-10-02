document.addEventListener "deviceready", ->
  angular.bootstrap document, ['cameraApp']

cameraApp = angular.module 'cameraApp', ['hmTouchevents']

cameraApp.controller 'IndexCtrl', ($scope)->

  # Native UI
  steroids.view.navigationBar.show "Camera"

  # Camera options

  $scope.imageSrc = null

  $scope.cameraOptions =
    fromPhotoLibrary:
      quality: 100
      destinationType: navigator.camera.DestinationType.IMAGE_URI
      sourceType: navigator.camera.PictureSourceType.PHOTOLIBRARY
      correctOrientation: true # Let Cordova correct the picture orientation (WebViews don't read EXIF data properly)
      targetWidth: 600
      popoverOptions: # iPad camera roll popover position
        width: 768
        height: 190
        arrowDir: Camera.PopoverArrowDirection.ARROW_UP

    fromCamera:
      quality: 100
      destinationType: navigator.camera.DestinationType.IMAGE_URI
      correctOrientation: true
      targetWidth: 600

  # Camera failure callback
  cameraError = (message)->
    navigator.notification.alert 'Cordova says: ' + message, null, 'Capturing the photo failed!'
    $scope.showSpinner = false
    $scope.$apply()

  # File system failure callback
  fileError = (error)->
    navigator.notification.alert "Cordova error code: " + error.code, null, "File system error!"
    $scope.showSpinner = false
    $scope.$apply()

  # Take a photo using the device's camera with given options, callback chain starts
  $scope.getPicture = (options)->
    navigator.camera.getPicture imageUriReceived, cameraError, options
    $scope.showSpinner = true
    $scope.$apply()

  # Move the selected photo from Cordova's default tmp folder to Steroids's user files folder
  imageUriReceived = (imageURI)->
    window.resolveLocalFileSystemURI imageURI, gotFileObject, fileError

  gotFileObject = (file)->
    # Define a target directory for our file in the user files folder
    # steroids.app variables require the Steroids ready event to be fired, so ensure that
    steroids.on "ready", ->
      targetDirURI = "file://" + steroids.app.absoluteUserFilesPath
      fileName = "user_pic.png"

      window.resolveLocalFileSystemURI(
        targetDirURI
        (directory)->
          file.moveTo directory, fileName, fileMoved, fileError
        fileError
      )

    # Store the moved file's URL into $scope.imageSrc
    fileMoved = (file)->
      # localhost serves files from both steroids.app.userFilesPath and steroids.app.path
      $scope.imageSrc = "/" + file.name
      $scope.showSpinner = false
      $scope.$apply()
