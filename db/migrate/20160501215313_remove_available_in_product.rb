class RemoveAvailableInProduct < ActiveRecord::Migration
  def change
    remove_column :products, :available, :boolean
  end
end
