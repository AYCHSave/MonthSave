class CreateSourceAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :source_accounts do |t|
      t.string :service
      t.references :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
