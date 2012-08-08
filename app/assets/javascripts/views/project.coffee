class App.Views.Project extends Backbone.View
  tagName: "tr"
  className: "project"
  template: JST['project']

  initialize: (options) ->
    @assignmentViews = []
    @weeks = options.weeks
    App.assignments.on 'add change:week change:project_id', @renderAssignments

  render: =>
    @$el.html @template(project: @model, weeks: @weeks)
    cells = @$el.find('td')

    # Unfortunately store a reference to this view b/c the drop callback
    # needs to reference JQuery's this
    cells.data('project-view', this)

    cells.droppable(drop: @handleDrop)

    @renderAssignments()

    this

  handleDrop: (event, ui) ->
    droppable = $(this)
    that = droppable.data('project-view')
    index = droppable.attr('data-index')
    draggedView = ui.draggable.data('backbone-view')

    switch draggedView.className
      when "contractor", "need"
        that.handleContractorDrop(draggedView.model, index)
      when "assignment"
        that.handleAssignmentDrop(draggedView.model, index)
      else
        console.error("Unknown item dropped on a project.")

  handleContractorDrop: (contractor, index) ->
    contractorId = contractor.id
    projectId = @model.id

    App.assignments.create
      contractor_id: contractorId
      project_id: projectId
      week: @indexToWeek(index)

  handleAssignmentDrop: (assignment, index) ->
    assignment.save
      project_id: @model.id
      week: @indexToWeek(index)

  handleTimelineShift: (weeks) =>
    @weeks = weeks
    @renderAssignments()

  indexToWeek: (index) =>
    @weeks[index].format("YYYY-MM-DD")

  renderAssignments: =>
    index = 0
    @clearAssignments()
    for week in @weeks
      for assignment in @model.assignmentsForWeek(week)
        assignmentView = new App.Views.Assignment(model: assignment)
        @assignmentViews.push assignmentView
        $(@$('td')[index]).append assignmentView.render().el
      index = index + 1

  clearAssignments: =>
    view.dispose for view in @assignmentViews
