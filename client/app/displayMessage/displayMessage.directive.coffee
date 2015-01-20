'use strict'

angular.module 'giffingApp'
.directive 'displayMessage', ->

  template: '<div></div>'

  restrict: 'A'

  link: (scope, element, attrs) ->

    {fader, displayMessage:messageKey} = attrs

    scope.$on 'displayMessage', (event, messageObject) ->
      toDisplay = messageObject[messageKey]
      if typeof toDisplay isnt undefined
        element.text toDisplay

        if fader
          element.stop(true, true)
          element.show()
          element.fadeOut parseInt(fader)
