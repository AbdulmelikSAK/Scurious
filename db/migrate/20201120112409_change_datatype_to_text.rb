class ChangeDatatypeToText < ActiveRecord::Migration[6.0]
  def change
    change_column :projects, :description, :text
    change_column :projects, :evolution, :text
    change_column :candidates, :message, :text
    change_column :users, :profile, :text
  end
end
