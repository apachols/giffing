'use strict'

angular.module 'giffingApp'
.factory 'contentList', ($http)->
  content = []
  active = null

  $http.get('/api/things').success (files) ->
    content = files
    active = if content.length? then 0 else null

  return {
    active: () ->
      return if not content.length or not active?
      content[active]

    next: () ->
      return if not content.length
      active = (active + 1 + content.length) % content.length
      console.log 'next', active, content[active]

    back: () ->
      return if not content.length
      active = (active - 1 + content.length) % content.length
      console.log 'back', active, content[active]

  }
