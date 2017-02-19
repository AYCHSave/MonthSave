class AddMinCentsToProjectUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :project_users, :min_cents, :integer
  end
end
