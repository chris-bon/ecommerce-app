class AddProductIdToImage < ActiveRecord::Migration
  def change
    remove_column :images, :supplier_logo, :string
    add_column :images, :image_name, :string
    add_column :images, :product_id, :integer
  end
end
