class App.Collections.Contractors extends Backbone.Collection
  model: App.Models.Contractor
  url: '/contractors'

  withoutAssignmentsForWeek: (week) ->
    @select (contractor) ->
      assignments = App.assignments.where
        contractor_id: contractor.id
        week: week.format('YYYY-MM-DD')
      assignments.length is 0
