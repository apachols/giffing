'use strict'

describe 'Service: contentList', ->

  # load the service's module
  beforeEach module 'giffingApp'

  # instantiate service
  contentList = undefined
  beforeEach inject (_contentList_) ->
    contentList = _contentList_

  it 'should do something', ->
    expect(!!contentList).toBe true
