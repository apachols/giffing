'use strict'

angular.module 'giffingApp'
.controller 'MainCtrl', ($scope, $http, contentList) ->
  $scope.contentList = contentList