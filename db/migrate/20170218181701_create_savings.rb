class CreateSavings < ActiveRecord::Migration[5.0]
  def change
    create_table :savings do |t|
      t.references :source_transaction, foreign_key: true
      t.references :coin_bank, foreign_key: true
      t.integer :price_cents

      t.timestamps
    end
  end
end
