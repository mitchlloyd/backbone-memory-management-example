#= require spec_helper
#= require models/timeline

describe 'Timeline with 4 weeks', ->
  before ->
    @timeline = new App.Models.Timeline
      weeks: 4,
      start: moment('2012-07-26', 'YYYY-MM-DD')

  describe 'weeks()', ->
    before ->
      @weeks = @timeline.weeks()

    it 'has a length of 4', ->
      @weeks.length.should.equal 4

    it 'begins with a date for the Sunday of the current week', ->
      @weeks[0].diff(moment("2012-07-22")).should.equal 0

    it 'ends with a date for the Sunday 3 weeks from now', ->
      @weeks[@weeks.length - 1].diff(moment("2012-08-12")).should.equal 0

  describe 'weeks() after shift(1)', ->
    before ->
      @spy = sinon.spy()
      @timeline.on("shift", @spy)

      @timeline.shift(1)
      @weeks = @timeline.weeks()

    it 'has a length of 4', ->
      @weeks.length.should.equal 4

    it 'begins with a date for next Sunday', ->
      @weeks[0].diff(moment("2012-07-29")).should.equal 0

    it 'ends with a date for the Sunday 4 weeks from now', ->
      @weeks[@weeks.length - 1].diff(moment("2012-08-19")).should.equal 0

    it "fires a 'shift' event with the weeks", ->
      @spy.withArgs(@weeks).calledOnce.should.equal true

