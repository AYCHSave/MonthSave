class CreateSourceTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :source_transactions do |t|
      t.string :external_id
      t.string :description
      t.integer :price_cents
      t.references :source_account, foreign_key: true

      t.timestamps
    end
  end
end
