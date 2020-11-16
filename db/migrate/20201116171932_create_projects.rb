class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :dev_id
      t.integer :angel_id
      t.string :title
      t.string :description
      t.string :evolution

      t.timestamps
    end
  end
end
