class AddGaslighterToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :gaslighter, :integer

  end
end
