class CartedProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates_presence_of :product_id, :order_id, :quantity
  validates :product_id, :order_id, :quantity, 
            numericality: {only_integer: true}
end
