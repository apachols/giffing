'use strict'

angular.module 'giffingApp'
.directive 'displayMessage', ->
  template: '<div></div>'
  restrict: 'A'
  link: (scope, element, attrs) ->
    messageKey = attrs.displayMessage
    scope.$on 'displayMessage', (event, messageObject)->
      toDisplay = messageObject[messageKey]
      if toDisplay then element.text toDisplay