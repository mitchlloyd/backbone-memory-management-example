class App.Models.Project extends Backbone.Model
  assignmentsForWeek: (week) ->
    App.assignments.where
      project_id: @id
      week: week.format('YYYY-MM-DD')
