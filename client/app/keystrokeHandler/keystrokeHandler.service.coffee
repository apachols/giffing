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
          'keystroke': timerService.displayPlayOrPause()
        }
      return true

    back: () ->
      $rootScope.$apply () ->
        contentList.back()
        timerService.restart()
        $rootScope.$broadcast 'displayMessage', {
          'keystroke': 'back',
          'info': contentList.getCurrent()
        }
      return true

    forward: () ->
      $rootScope.$apply () ->
        contentList.next()
        timerService.restart()
        $rootScope.$broadcast 'displayMessage', {
          'keystroke': 'forward',
          'info': contentList.getCurrent()
        }
      return true

    slower: () ->
      $rootScope.$apply () ->
        timerService.slower()
        $rootScope.$broadcast 'displayMessage', {
          'keystroke': 'slower',
          'info': timerService.displayCurrentSpeed()
        }
      return true

    faster: () ->
      $rootScope.$apply () ->
        timerService.faster()
        $rootScope.$broadcast 'displayMessage', {
          'keystroke': 'faster',
          'info': timerService.displayCurrentSpeed()
        }
      return true

  }
  return self
