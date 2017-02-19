class AddTerminatedAtToCoinBanks < ActiveRecord::Migration[5.0]
  def change
    add_column :coin_banks, :terminated_at, :timestamp
  end
end
