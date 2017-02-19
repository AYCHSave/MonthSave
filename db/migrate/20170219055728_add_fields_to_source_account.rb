class AddFieldsToSourceAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :source_accounts, :email, :string
    add_column :source_accounts, :password, :string
    add_column :source_accounts, :account, :string
    add_column :source_accounts, :agency, :string
  end
end
