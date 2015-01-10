'use strict'

describe 'Service: timerService', ->

  # load the service's module
  beforeEach module 'giffingApp'

  # instantiate service
  timerService = undefined
  beforeEach inject (_timerService_) ->
    timerService = _timerService_

  it 'should do something', ->
    expect(!!timerService).toBe true
