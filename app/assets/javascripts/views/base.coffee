# Based on http://stackoverflow.com/a/7607853/492254

class App.Views.Base extends Backbone.View
  bindTo: (model, event, callback) ->
    @bindings or= []
    model.bind(event, callback, this)
    @bindings.push(model: model, event: event, callback: callback)

  unbindFromAll: ->
    return unless @bindings
    for binding in @bindings
      binding.model.unbind(binding.event, binding.callback)
      @bindings = []

  dispose: ->
    @unbindFromAll()
    @unbind()
    @remove()
