#= require 'models/contractor'

class App.Models.ContractorNeed extends App.Models.Contractor
  initialize: ->
    @set 'name', 'NEED'
    @set 'id', 'NEED'
