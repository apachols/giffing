'use strict'

# this controller is used to load the next image. it is 'shown' in the DOM but
# we hide the image via CSS. this is basically pre-loading the image. I *think*
# Angular is smart enough to cache the image, but I can't prove it - checking
# the network tabs and the webserver logs lead me to think this.
angular.module 'giffingApp'
  .controller 'futureImage', ($scope) ->
    $scope.imgsrc = ''

    $scope.$on 'showImage', (evt, url) ->
      $scope.imgsrc = url
