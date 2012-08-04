class CreateProductCharges < ActiveRecord::Migration
  def change
    create_table :product_charges do |t|
      t.string :stripe_id
      t.decimal :amount, :precision => 15, :scale => 2
      t.datetime :charged_at
      t.decimal :fee, :precision => 15, :scale => 2

      t.timestamps
    end
  end
end
