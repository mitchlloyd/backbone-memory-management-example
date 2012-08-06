NUMBER_OF_WEEKS = 7

App =
  Models: {}
  Collections: {}
  Views: {}

  init: (options) ->
    App.projects = new App.Collections.Projects(options.projects)
    App.contractors = new App.Collections.Contractors(options.contractors)
    App.assignments = new App.Collections.Assignments(options.assignments)
    App.timeline = new App.Models.Timeline(weeks: NUMBER_OF_WEEKS)
    scheduleView = new App.Views.Schedule(el: options.el)
    scheduleView.render()


window.App = App
