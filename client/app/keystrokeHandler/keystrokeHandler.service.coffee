'use strict'

angular.module 'giffingApp'
.factory 'keystrokeHandler',  ($rootScope, contentList, timerService, $document) ->
  self = {

    stop: () ->
      $document.unbind 'keydown', self.handleKeystroke

    start: ()->
      $document.bind 'keydown', self.handleKeystroke

    handleKeystroke: (e) ->
      switch e.which
        when 32  then do self.playOrPause and e.preventDefault()
        when 188 then do self.back        and e.preventDefault()
        when 37  then do self.back        and e.preventDefault()
        when 190 then do self.forward     and e.preventDefault()
        when 39  then do self.forward     and e.preventDefault()
        when 189 then do self.slower      and e.preventDefault()
        when 187 then do self.faster      and e.preventDefault()
        when 83  then do self.shuffle     and e.preventDefault()

    shuffle: () ->
      $rootScope.$apply () ->
        contentList.shuffle()
        $rootScope.$broadcast 'displayMessage', {
          'keypress': 's',
          'action': 'shuffle'
        }
      return true

    playOrPause: () ->
      $rootScope.$apply () ->
        timerService.toggle()
        $rootScope.$broadcast 'displayMessage', {
          'action': timerService.displayPlayOrPause()
        }
      return true

    back: () ->
      $rootScope.$apply () ->
        contentList.back()
        timerService.restart()
        $rootScope.$broadcast 'displayMessage', {
          'keypress': "<",
          'action': 'back'
          'info': contentList.active()
        }
      return true

    forward: () ->
      $rootScope.$apply () ->
        contentList.next()
        timerService.restart()
        $rootScope.$broadcast 'displayMessage', {
          'keypress': ">",
          'action': 'forward'
          'info': contentList.active()
        }
      return true

    slower: () ->
      $rootScope.$apply () ->
        timerService.slower()
        $rootScope.$broadcast 'displayMessage', {
          'timer': timerService.displayCurrentSpeed()
          'keypress': "-",
          'action': 'slower'
        }
      return true

    faster: () ->
      $rootScope.$apply () ->
        timerService.faster()
        $rootScope.$broadcast 'displayMessage', {
          'timer': timerService.displayCurrentSpeed()
          'keypress': "+",
          'action': 'faster'
        }
      return true
  }

  return self
