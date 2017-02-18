class CreateWithdrawalTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :withdrawal_transactions do |t|
      t.integer :price_cents
      t.references :account, foreign_key: { to_table: :withdrawal_accounts }

      t.timestamps
    end
  end
end
