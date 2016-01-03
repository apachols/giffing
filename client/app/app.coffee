'use strict'

angular.module 'giffingApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'ui.bootstrap'
]
.config ($routeProvider, $locationProvider) ->
  $routeProvider
  .otherwise
    redirectTo: '/'

  $locationProvider.html5Mode true

.run (contentList, keystrokeHandler, $rootScope) ->

  contentList.loadFiles()

  keystrokeHandler.start()

  $rootScope.$on 'tick', ()->
    contentList.next()