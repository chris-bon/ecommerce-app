class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :categorized_products
  has_many :categories, through: :categorized_products

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true

  DISCOUNT_THRESHOLD = 1500
  SALES_TAX = 0.0875

  def sale_message
    price < DISCOUNT_THRESHOLD ? 'Discount Item!' : 'On Sale!'
  end

  def sale_color
    price < DISCOUNT_THRESHOLD ? 'green' : 'blue'
  end

  def stocked_color
    stocked ? 'green' : 'red'
  end

  def tax
    price * SALES_TAX
  end

  def total
    price + tax
  end
end
