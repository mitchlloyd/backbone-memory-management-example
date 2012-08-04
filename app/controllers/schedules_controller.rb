class SchedulesController < ApplicationController
  attr_reader :projects, :contractors, :assignments
  helper_method :projects, :contractors, :assignments

  def show
    @projects = Project.active
    @contractors = Contractor.all
    @assignments = Assignment.all
  end
end
