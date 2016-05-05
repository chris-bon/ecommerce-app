class CategorizedProduct < ActiveRecord::Base
  belongs_to :category
  belongs_to :product

  validates_presence_of :category_id, :product_id
  validates :category_id, :product_id, numericality: {only_integer: true}
end
