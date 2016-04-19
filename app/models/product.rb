class Product < ActiveRecord::Base
  def sale_message
    price < 1500 ? 'Discount Item!' : 'On Sale!'
  end

  def color_message
    price < 1500 ? 'green' : 'blue'
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
