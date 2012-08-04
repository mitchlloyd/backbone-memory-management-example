class ChangeNotesToTextOnTimeEntries < ActiveRecord::Migration
  def change
    change_column :time_entries, :notes, :text
  end
end
