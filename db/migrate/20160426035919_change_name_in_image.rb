class ChangeNameInImage < ActiveRecord::Migration
  def change
    remove_column :images, :product_url, :string
    add_column :images, :image_url, :string
  end
end
