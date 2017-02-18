class CreateWithdrawalAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :withdrawal_accounts do |t|
      t.string :service
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
