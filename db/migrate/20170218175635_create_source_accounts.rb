class CreateSourceAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :source_accounts do |t|
      t.string :service
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
