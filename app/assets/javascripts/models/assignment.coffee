class App.Models.Assignment extends Backbone.Model
  contractorName: ->
    @contractor().get('name')

  contractor: ->
    contractor = App.contractors.get(@get('contractor_id'))
    if contractor then contractor else new App.Models.ContractorNeed
