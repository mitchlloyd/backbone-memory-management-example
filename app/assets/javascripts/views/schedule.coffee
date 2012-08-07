class App.Views.Schedule extends Backbone.View
  events:
    "click #left-arrow": "handleTimelineShiftIntentLeft"
    "click #right-arrow": "handleTimelineShiftIntentRight"

  initialize: ->
    App.timeline.on 'shift', @handleTimelineShift
    @weeks = App.timeline.weeks()
    @contractorViews = []
    @benchView = new App.Views.Bench(weeks: @weeks)

  render: =>
    @$el.empty()
    @renderHeader()
    @renderProjects()
    @renderBench()
    @renderContractors()

  renderProjects: =>
    projects = App.projects.models

    for project in projects
      projectView = new App.Views.Project(model: project, weeks: @weeks)
      @$el.append projectView.render().el
      projectView.on 'drop', @handleDrop

  renderHeader: =>
    formattedWeeks = (week.format("M/D") for week in @weeks)
    @$el.html JST['schedule_header'](weeks: formattedWeeks)

  renderContractors: =>
    $('ul.contractors').empty()
    $('ul.contractors').append (new App.Views.Need).render().el

    for contractor in App.contractors.models
      view = new App.Views.Contractor(model: contractor)
      $('ul.contractors').append view.render().el

  renderBench: ->
    @benchView.weeks = @weeks
    @$el.append @benchView.render().el

  initializeWeeks: ->
    @weeks = []
    for i in [0..3]
      @weeks.push moment().day(0).add('weeks', i)

  handleTimelineShiftIntentLeft: ->
    App.timeline.shift(-1)
    @render()

  handleTimelineShiftIntentRight: ->
    App.timeline.shift(1)
    @render()

  handleTimelineShift: (weeks) =>
    @weeks = weeks
    @renderHeader()
