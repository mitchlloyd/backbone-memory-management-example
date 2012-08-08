#= require views/helpers

class App.Views.Assignment extends Backbone.View
  tagName: 'div'
  className: 'assignment'

  events:
    "click .delete": "destroy"

  initialize: ->
    @model.on 'destroy', => @remove()
    @$el.data('backbone-view', this)
    @$el.draggable(revert: true, revertDuration: 1)
    @$el.attr('data-id', @model.id)

  render: ->
    contractor = @model.contractor()
    if contractor.isNeed()
      initials = @model.contractorName()
      imageTag = App.helpers.gravatarImg(null, class: 'blank')
    else
      initials = App.helpers.nameToInitials(@model.contractorName())
      imageTag = App.helpers.gravatarImg(contractor.get('gravatar_hash'))

    @$el.html """
      #{imageTag}
      <span class="name">#{initials}</span>
      <a class="delete" href="#delete">×</a>
    """
    @$el.attr 'title', @model.contractorName()
    this

  destroy: => @model.destroy()
