class AssignmentsController < ApplicationController
  def create
    @assignment = Assignment.create(params[:assignment])
    render json: {id: @assignment.id}
  end

  def update
    @assignment = Assignment.find(params[:id])
    @assignment.update_attributes(params[:assignment])
    render json: {success: true}
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy()
    render json: {success: true}
  end
end
