class ProjectsController < InheritedResources::Base
  respond_to :html, :json

  def collection
    @projects = TimeEntry.for_month(params[:month_name], params[:year]).includes(:project).group("projects.id").order("sum_hours DESC").sum(:hours)
  end
end
