class AddVirtualToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :virtual, :boolean
  end
end
