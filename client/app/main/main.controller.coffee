'use strict'

angular.module 'giffingApp'
.controller 'MainCtrl', ($scope, contentList, keystrokeHandler) ->
  $scope.contentList = contentList

  $scope.$on "changeImage", (event, imageUrl)->
    $scope.imageSrc = imageUrl