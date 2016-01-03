'use strict'

angular.module 'giffingApp'
.factory 'timerService', ($interval, $rootScope) ->
  selected = 2
  speeds = [ 2500, 5000, 7500, 10000, 12500, 15000, 20000, 25000, 30000, 45000, 60000, 180000, 300000 ]

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
      if playing then (self.getCurrentSpeed()/1000)+'s' else ''

    getCurrentSpeed: () ->
      return speeds[selected]

    restart: () ->
      if self.stop() then self.start()

    toggle: () ->
      if playing then self.stop() else self.start()

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
  # start timer on load
  self.start()

  return self