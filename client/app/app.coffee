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

.run ($rootScope, contentList, timerService, $document)->
  console.log 'wat'

  $document.bind 'keypress', (e) ->
    console.log 'KEYPRESS', e.which
    switch e.which
      when 32 then console.log 'PLAY/PAUSE'
      when 44 then console.log '<'
      when 46 then console.log '>'

    # $rootScope.$emit 'keypress', e

  # timerService.start()

  $rootScope.$on 'tick', ()->
    console.log 'tock'
    contentList.next()