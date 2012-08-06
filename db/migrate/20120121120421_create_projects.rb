class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :display
      t.decimal :rate, :precision => 15, :scale => 2
      t.integer :freshbooks_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
