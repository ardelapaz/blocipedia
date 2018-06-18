class ChangePublishedToIsPrivate < ActiveRecord::Migration[5.1]
  def change
    rename_column :wikis, :published, :is_private

  end
end
