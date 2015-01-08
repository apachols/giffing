'use strict'

angular.module 'giffingApp'
.controller 'MainCtrl', ($scope, $http) ->
  $scope.filename = ''

  $scope.setFilename = (file) ->
    $scope.filename = file

  $scope.awesomeThings = []

  $http.get('/api/things').success (awesomeThings) ->
    $scope.awesomeThings = awesomeThings
    

