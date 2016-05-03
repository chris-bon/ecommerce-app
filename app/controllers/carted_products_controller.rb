class CartedProductsController < ApplicationController
  # GET /orders
  def index
    open_order = current_user.orders.find_by completed: false
    @carted_products = open_order.carted_products
  end

  # GET /orders/1
  def show
    
  end

  def create
    product = Product.find_by id: params[:product_id]
    quantity = params[:quantity].to_i
    subtotal = product.price * quantity
    tax = subtotal * 0.0875
    if order = current_user.orders.find_by(completed: false)
      CartedProduct.create product_id: product.id, order_id: order.id,
                           quantity: quantity
    else
      order = Order.create product_id: product.id, user_id: current_user.id,
                           subtotal: subtotal, tax: tax, total: subtotal + tax,
                           completed: false
      CartedProduct.create product_id: product.id, order_id: order.id,
                           quantity: quantity
    end
    flash[:sucess] = 'Added <%= product.name %> to Cart!'
    redirect_to '/carted_products'
  end
end
