#= require spec_helper
#= require views/helpers

describe 'nameToInitials', ->
  it "converts a name with first and last name to initials", ->
    App.helpers.nameToInitials('Mitch Lloyd').should.equal 'ML'
  it "converts one word to just one letter", ->
    App.helpers.nameToInitials('hello').should.equal 'H'
  it "takes only the first two letters", ->
    App.helpers.nameToInitials('Chris Nelson Consulting').should.equal 'CN'
  it "returns an empty string if you pass it nothing", ->
    App.helpers.nameToInitials().should.equal ''
  it "ignores space at the beginning and end of a name", ->
    App.helpers.nameToInitials("  Mitch Lloyd ").should.equal 'ML'

