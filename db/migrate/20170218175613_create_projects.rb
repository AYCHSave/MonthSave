class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.references :owner, foreign_key: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
