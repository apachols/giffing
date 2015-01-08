'use strict'

angular.module 'giffingApp'
.controller 'MainCtrl', ($scope, $http) ->
  $scope.awesomeThings = []

  $http.get('/api/things').success (awesomeThings) ->
    $scope.awesomeThings = awesomeThings
    

