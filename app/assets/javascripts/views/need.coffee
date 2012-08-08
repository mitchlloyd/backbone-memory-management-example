class App.Views.Need extends App.Views.Base
  tagName: 'li'
  className: 'need'

  initialize: ->
    @model = App.Models.ContractorNeed

  render: ->
    @$el.html "<span class='name'>NEED</span>"
    @$el.draggable(revert: true, revertDuration: 1)
    @$el.data('backbone-view', this)
    this
