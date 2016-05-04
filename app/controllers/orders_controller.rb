class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  def index
    @orders = current_user.orders
    render 'show'
  end

  # GET /orders/1
  def show
    @order = current_user.orders.find_by id: params[:id]
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # POST /orders
  def create
    product = Product.find_by id: params[:product_id]
    quantity = params[:quantity].to_i
    total_tax = product.tax * quantity
    subtotal = product.price * quantity
    total = total_tax + subtotal
    Order.create product_id: product.id, user_id: current_user.id, 
                 tax: total_tax, subtotal: subtotal, total: total,
                 quantity: quantity
    redirect_to "/orders/#{order.id}"
  end

  # GET /orders/1/edit
  def edit
  end

  # PATCH/PUT /orders/1
  def update
    order = Order.find_by id: params[:id]
    total_subtotal = 0
    total_tax = 0
    order.carted_products.each do |carted_product|
      quantity = carted_product.quantity
      total_subtotal += quantity * carted_product.product.subtotal
      total_tax += quantity * carted_product.product.tax
    end
    order.update completed: true, subtotal: total_subtotal, tax: total_tax,
                 total: total_subtotal + total_tax
  end

  # DELETE /orders/1
  def destroy
    Order.find_by(id: params[:id]).destroy
    redirect_to '/'
    flash[:danger] = 'Order deleted!'
  end

  private
  def set_order
    @order = Order.find params[:id]
  end

  def order_params
    params.fetch :order, {}
  end
end
