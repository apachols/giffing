'use strict'

angular.module 'giffingApp'
.factory 'timerService', ($interval, $rootScope) ->
  selected = 0
  speeds = [ 5000, 10000, 15000, 20000, 25000, 30000, 45000, 60000, 180000, 300000 ]

  promise = null
  playing = false

  tick = () ->
    $rootScope.$emit 'tick'

  max = (left, right) -> if left < right then right else left
  min = (left, right) -> if left < right then left else right

  self = {
    displayPlayOrPause: () ->
      if playing then "playing" else "paused"

    displayCurrentSpeed: () ->
      return (self.getCurrentSpeed()/1000)+'s'

    getCurrentSpeed: () ->
      return speeds[selected]

    restart: () ->
      if self.stop() then self.start()

    toggle: () ->
      if not self.stop() then self.start()

    faster: () ->
      selected = max selected-1, 0
      self.restart()

    slower: () ->
      selected = min selected+1, speeds.length-1
      self.restart()

    start: () ->
      playing = true
      promise = $interval tick, self.getCurrentSpeed()

    stop: () ->
      playing = false
      return $interval.cancel promise
  }

  return self