class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.integer :contractor_id
      t.integer :project_id
      t.integer :freshbooks_id
      t.date :date
      t.string :notes
      t.decimal :hours, :precision => 15, :scale => 2

      t.timestamps
    end
  end
end
