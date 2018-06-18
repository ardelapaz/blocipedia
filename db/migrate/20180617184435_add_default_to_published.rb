class AddDefaultToPublished < ActiveRecord::Migration[5.1]
  def change
    change_column :wikis, :published, :boolean, :default => false
  end
end
