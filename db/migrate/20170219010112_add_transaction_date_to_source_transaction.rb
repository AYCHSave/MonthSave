class AddTransactionDateToSourceTransaction < ActiveRecord::Migration[5.0]
  def change
    add_column :source_transactions, :transaction_date, :datetime
  end
end
