class App.Views.Schedule extends App.Views.Base
  events:
    "click #left-arrow": "handleTimelineShiftIntentLeft"
    "click #right-arrow": "handleTimelineShiftIntentRight"

  initialize: ->
    App.timeline.on 'shift', @handleTimelineShift
    @weeks = App.timeline.weeks()
    @contractorViews = []
    @benchView = new App.Views.Bench(weeks: @weeks)

  render: =>
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
    @$('tr.header').html JST['schedule_header'](weeks: formattedWeeks)

  renderContractors: =>
    @disposeContractors()

    @contractorViews.push (new App.Views.Need)

    for contractor in App.contractors.models
      view = new App.Views.Contractor(model: contractor)
      @contractorViews.push view

    $('ul.contractors').append view.render().el for view in @contractorViews

  disposeContractors: ->
    view.dispose() for view in @contractorViews
    @contractorViews = []

  renderBench: ->
    @benchView.weeks = @weeks
    @$el.append @benchView.render().el

  initializeWeeks: ->
    @weeks = []
    for i in [0..3]
      @weeks.push moment().day(0).add('weeks', i)

  handleTimelineShiftIntentLeft: ->
    App.timeline.shift(-1)

  handleTimelineShiftIntentRight: ->
    App.timeline.shift(1)

  handleTimelineShift: (weeks) =>
    @weeks = weeks
    @renderHeader()
