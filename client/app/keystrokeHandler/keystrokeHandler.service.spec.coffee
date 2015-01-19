'use strict'

describe 'Service: keystrokeHandler', ->

  # load the service's module
  beforeEach module 'giffingApp'

  # instantiate service
  keystrokeHandler = undefined
  beforeEach inject (_keystrokeHandler_) ->
    keystrokeHandler = _keystrokeHandler_

  it 'should do something', ->
    expect(!!keystrokeHandler).toBe true
