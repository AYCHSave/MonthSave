class AddUserToWithdrawalTransactions < ActiveRecord::Migration[5.0]
  def change
    add_reference :withdrawal_transactions, :user
  end
end
