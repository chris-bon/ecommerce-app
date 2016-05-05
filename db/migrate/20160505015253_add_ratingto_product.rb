class AddRatingtoProduct < ActiveRecord::Migration
  def change
    add_column :products, :rating, :float
  end
end
