'use strict'

angular.module 'giffingApp'
.factory 'contentList', ($http)->
  content = []
  active = null

  self = {
    shuffle: () ->
      content = _.shuffle( content )

    loadFiles: () ->
      return $http.get('/api/things').success (files) ->
        content = files
        active = if content.length? then 0 else null
        # @TODO make 'shuffling by default' configurable
        # ... lol nobody will do this ever
        self.shuffle()
        self.setImage()

    active: () ->
      return if not content.length or not active?
      content[active]

    next: () ->
      return if not content.length
      active = (active + 1 + content.length) % content.length
      self.setImage()

    back: () ->
      return if not content.length
      active = (active - 1 + content.length) % content.length
      self.setImage()

    setImage: (imageUrl) ->
      imageUrl = imageUrl || './content/' + content[active]

      body = angular.element('body')
      body.css 'background-image','url('+imageUrl+')'
  }
  return self