class CreateCoinBanks < ActiveRecord::Migration[5.0]
  def change
    create_table :coin_banks do |t|
      t.references :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
