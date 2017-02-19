class AddFieldsToWithdrawalAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :withdrawal_accounts, :email, :string
    add_column :withdrawal_accounts, :account, :string
    add_column :withdrawal_accounts, :agency, :string
  end
end
