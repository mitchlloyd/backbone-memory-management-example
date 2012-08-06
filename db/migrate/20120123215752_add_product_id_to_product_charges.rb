class AddProductIdToProductCharges < ActiveRecord::Migration
  def change
    add_column :product_charges, :product_id, :integer
  end
end
