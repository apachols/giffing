'use strict'

angular.module 'giffingApp'
.factory 'contentList', ($http)->
  content = []
  active = null

  self = {
    loadFiles: () ->
      return $http.get('/api/things').success (files) ->
        content = files
        active = if content.length? then 0 else null
        self.setImage()

    active: () ->
      return if not content.length or not active?
      content[active]

    next: () ->
      return if not content.length
      active = (active + 1 + content.length) % content.length
      console.log 'next', active, content[active]
      self.setImage()

    back: () ->
      return if not content.length
      active = (active - 1 + content.length) % content.length
      console.log 'back', active, content[active]
      self.setImage()

    setImage: (imageUrl) ->
      imageUrl = imageUrl || './content/' + content[active]
      console.log "setImage", imageUrl

      # @todo THIS IS AN EVIL HACK, FIX IT.  Why does setting the URL blow the other two away?
      body = angular.element('body')
      body.css 'background','url('+imageUrl+') no-repeat'

      body.css 'background-size','contain'
      body.css 'background-color','black'
      body.css 'background-attachment','scroll'
      body.css 'background-position', 'center'
  }
  return self