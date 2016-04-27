class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images

  def sale_message
    price < 1500 ? 'Discount Item!' : 'On Sale!'
  end

  def sale_color
    price < 1500 ? 'green' : 'blue'
  end

  def stocked_color
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
