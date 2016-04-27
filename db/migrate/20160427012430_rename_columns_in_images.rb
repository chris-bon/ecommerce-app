class RenameColumnsInImages < ActiveRecord::Migration
  def change
    rename_column :images, :image_name, :name
    rename_column :images, :image_url, :url
  end
end
