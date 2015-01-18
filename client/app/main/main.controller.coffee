'use strict'

angular.module 'giffingApp'
.controller 'MainCtrl', ($scope, $rootScope, contentList, keystrokeHandler) ->
  $scope.contentList = contentList

  $scope.message = "BLAH"

  $rootScope.$on "playOrPause", () ->
    $rootScope.$apply () ->
      $scope.message = "playOrPause"

  $rootScope.$on "back", () ->
    $rootScope.$apply () ->
      $scope.message = "back"

  $rootScope.$on "forward", () ->
    $rootScope.$apply () ->
      $scope.message = "forward"

  $rootScope.$on "slower", () ->
    $rootScope.$apply () ->
      $scope.message = "slower"

  $rootScope.$on "faster", () ->
    $rootScope.$apply () ->
      $scope.message = "faster"



