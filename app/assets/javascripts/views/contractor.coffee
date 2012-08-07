#= require views/helpers

class App.Views.Contractor extends Backbone.View
  tagName: 'li'
  className: 'contractor'

  initialize: ->
    @model.on 'change:display', @toggleVisibility
    @$el.data('backbone-view', this)
    @$el.draggable(revert: true, revertDuration: 1)
    @$el.attr('data-id', @model.id)

  render: =>
    @$el.html """
      #{@gravatarImg()}
      <span class="name">#{@contractorInitials()}</span>
    """
    @$el.attr 'title', @model.get('name')
    @toggleVisibility()
    this

  gravatarImg: ->
    hash = @model.get('gravatar_hash')
    App.helpers.gravatarImg(hash)

  contractorInitials: =>
    App.helpers.nameToInitials(@model.get('name'))

  toggleVisibility: =>
    if @model.get('display')
      @$el.removeClass 'hidden'
    else
      @$el.addClass 'hidden'
