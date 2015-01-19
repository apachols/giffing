'use strict'

angular.module 'giffingApp'
.controller 'MainCtrl', ($scope, $rootScope, contentList, keystrokeHandler) ->
  $scope.contentList = contentList