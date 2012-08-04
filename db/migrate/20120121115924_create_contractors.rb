class CreateContractors < ActiveRecord::Migration
  def change
    create_table :contractors do |t|
      t.integer :freshbooks_id
      t.string :name
      t.boolean :display

      t.timestamps
    end
  end
end
