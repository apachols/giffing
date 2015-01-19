'use strict'

describe 'Directive: displayMessage', ->

  # load the directive's module
  beforeEach module 'giffingApp'
  element = undefined
  scope = undefined
  beforeEach inject ($rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<display-message></display-message>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the displayMessage directive'
