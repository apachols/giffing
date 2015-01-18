'use strict'

angular.module 'giffingApp'
.factory 'timerService', ($interval, $rootScope) ->
  selected = 0
  speeds = [ 5000, 10000, 15000, 20000, 25000, 30000, 45000, 60000, 180000, 300000 ]

  promise = null

  tick = () ->
    console.log 'tick', speeds[selected]
    $rootScope.$emit 'tick'

  max = (left, right) -> if left < right then right else left
  min = (left, right) -> if left < right then left else right

  self = {
    restart: () ->
      if self.stop() then self.start()

    toggle: () ->
      if not self.stop() then self.start()

    faster: () ->
      selected = max selected-1, 0
      self.restart()
      console.log 'timer faster', selected

    slower: () ->
      selected = min selected+1, speeds.length-1
      self.restart()
      console.log 'timer slower', selected

    start: () ->
      console.log 'timer start', speeds[selected]
      promise = $interval tick, speeds[selected]

    stop: () ->
      console.log 'timer stop', promise
      return $interval.cancel promise
  }

  return self