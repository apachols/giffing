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

  $document.bind 'keydown', (e) ->
    # console.log 'keydown', e.which
    switch e.which
      when 32  then console.log 'PLAY/PAUSE' and timerService.toggle() and e.preventDefault()
      when 188 then console.log '<' and $rootScope.$apply contentList.back() #and timerService.restart()
      when 190 then console.log '>' and $rootScope.$apply contentList.next() #and timerService.restart()
      when 187 then console.log '-' and timerService.slower()
      when 189 then console.log '+' and timerService.faster()

  $rootScope.$on 'tick', ()->
    console.log 'tock'
    contentList.next()