class CartedProductsController < ApplicationController
  # GET /orders
  def index
    @order = current_user.orders.find_by completed: false
  end

  # POST /orders
  def create
    subtotal = product.price * quantity
    tax = subtotal * 0.0875
    order = current_user.orders.find_by(completed: false) ||
            Order.create(product_id: params[:product.id],
                         user_id: current_user.id, completed: false,
                         subtotal: subtotal, tax: tax, total: subtotal + tax)
    CartedProduct.create product_id: params[:product_id], order_id: order.id,
                         quantity: params[:quantity].to_i
    flash[:sucess] = "Added #{product.name} to Cart!"
    redirect_to '/carted_products'
  end

  # DELETE /orders/1
  def destroy
    CartedProduct.find_by(id: params[:id]).destroy
    redirect_to '/carted_products'
  end
end
