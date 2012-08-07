class App.Views.Bench extends Backbone.View
  tagName: 'tr'
  className: 'bench'

  events:
    "click a[href='#toggle-show-all']": "toggleShowAll"

  initialize: (options) ->
    @weeks = options.weeks
    @benchedContractorViews = []
    App.assignments.on 'add remove change', @render

  render: =>
    @$el.html """
      <th class="project-title">
        Bench
        <a href="#toggle-show-all">
          <span class="show">(show all)</span>
          <span class="hide">(hide some)</span>
        </a>
      </th>
    """
    @renderAllBenchedContractors()
    this

  renderAllBenchedContractors: ->
    @$('td').remove()
    @renderBenchedContractorsForWeek(week) for week in @weeks

  renderBenchedContractorsForWeek: (week) ->
    benchedContractors = App.contractors.withoutAssignmentsForWeek(week)
    cellEl = $("<td></td>")

    for contractor in benchedContractors
      view = new App.Views.BenchedContractor(model: contractor)
      @benchedContractorViews.push view
      cellEl.append view.render().el

    @$el.append cellEl

  toggleShowAll: =>
    @$el.toggleClass('show-all')

  handleTimelineShift: (weeks) =>
    @weeks = weeks
    @renderAllBenchedContractors()
