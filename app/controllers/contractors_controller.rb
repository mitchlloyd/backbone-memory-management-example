class ContractorsController < InheritedResources::Base
  respond_to :html, :json

  def index
    if request.format.json?
      render json: Contractor.all.to_json(methods: :gravatar_hash)
    else
      super
    end
  end

  def update
    @contractor = Contractor.find(params[:id])
    @contractor.update_attributes(params[:contractor])
    render json: { success: true }
  end

  protected

  def resource
    @contractor = Contractor.find(params[:id])
    @projects = TimeEntry.for_month(params[:month_name], params[:year]).includes(:project).where(:contractor_id => @contractor).group("projects.id").order("sum_hours DESC").sum(:hours)
  end

  def collection
    @contractors = TimeEntry.for_month(params[:month_name], params[:year]).includes(:contractor).group("contractors.id").order("sum_hours DESC").sum(:hours)
    @hours_per_capita = (@contractors.collect{ |c| c[1] }.inject(0, :+)/@contractors.size).round(1) unless @contractors.size == 0
  end
end

