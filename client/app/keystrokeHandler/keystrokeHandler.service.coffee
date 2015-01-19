'use strict'

angular.module 'giffingApp'
.factory 'keystrokeHandler',  ($rootScope, contentList, timerService, $document) ->
  self = {

    stop: () ->
      $document.unbind 'keydown', self.handleKeystroke

    start: ()->
      $document.bind 'keydown', self.handleKeystroke

    handleKeystroke: (e) ->
      # console.log 'keydown', e.which
      switch e.which
        when 32  then do self.playOrPause and e.preventDefault()
        when 188 then do self.back        and e.preventDefault()
        when 190 then do self.forward     and e.preventDefault()
        when 187 then do self.slower      and e.preventDefault()
        when 189 then do self.faster      and e.preventDefault()

    playOrPause: () ->
      $rootScope.$apply () ->
        timerService.toggle()
        $rootScope.$broadcast 'displayMessage', {
          'keypress': 'SPACE',
          'action': timerService.displayPlayOrPause(),
          'timer': timerService.displayCurrentSpeed()
        }
      return true

    back: () ->
      $rootScope.$apply () ->
        contentList.back()
        timerService.restart()
        $rootScope.$broadcast 'displayMessage', {
          'keypress': "<",
          'action': 'back',
          'info': contentList.active()
          'timer': timerService.displayCurrentSpeed()
        }
      return true

    forward: () ->
      $rootScope.$apply () ->
        contentList.next()
        timerService.restart()
        $rootScope.$broadcast 'displayMessage', {
          'keypress': ">",
          'action': 'forward',
          'info': contentList.active(),
          'timer': timerService.displayCurrentSpeed()
        }
      return true

    slower: () ->
      $rootScope.$apply () ->
        timerService.slower()
        $rootScope.$broadcast 'displayMessage', {
          'keypress': "+",
          'action': 'slower',
          'timer': timerService.displayCurrentSpeed()
        }
      return true

    faster: () ->
      $rootScope.$apply () ->
        timerService.faster()
        $rootScope.$broadcast 'displayMessage', {
          'keypress': "-",
          'action': 'faster',
          'timer': timerService.displayCurrentSpeed()
        }
      return true

  }
  return self
