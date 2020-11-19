class AddCatchphraseToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :catchphrase, :string
  end
end
