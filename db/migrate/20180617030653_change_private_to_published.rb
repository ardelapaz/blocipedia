class ChangePrivateToPublished < ActiveRecord::Migration[5.1]
  def change
    rename_column :wikis, :private, :published
  end
end
