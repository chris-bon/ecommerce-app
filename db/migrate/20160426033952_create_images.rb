class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :product_url
      t.string :supplier_logo

      t.timestamps null: false
    end
  end
end
