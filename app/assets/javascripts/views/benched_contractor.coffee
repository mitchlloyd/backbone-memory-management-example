class App.Views.BenchedContractor extends Backbone.View
  tagName: 'div'
  className: 'benched-contractor'

  events:
    "click a.hide-contractor": "handleHideContractorClick"
    "click a.show-contractor": "handleShowContractorClick"

  initialize: ->
    @model.on 'change:display', @toggleVisibility

  render: ->
    @$el.html """
      <span>#{@model.get('name')}</span>
      <a class="hide-contractor" href="#hide-contractor" title="hide">
        ×
      </a>
      <a class="show-contractor" href="#show-contractor" title="show">
       +
      </a>
    """
    @toggleVisibility()
    this

  handleHideContractorClick: (event) =>
    @model.set('display', false)
    @model.save()

  handleShowContractorClick: (event) =>
    @model.set('display', true)
    @model.save()

  toggleVisibility: =>
    if @model.get('display')
      @$el.removeClass 'hidden'
    else
      @$el.addClass 'hidden'
