#= require moment

class App.Models.Timeline extends Backbone.Model
  initialize: (options={}) ->
    @numOfWeeks = options.weeks
    start = options.start or moment()
    @startWeek = start.day(0).sod()

  weeks: ->
    (@startWeek.clone().add('weeks', i) for i in [0...@numOfWeeks])

  shift: (num) ->
    @startWeek.add('weeks', num)
    @trigger 'shift', @weeks()
