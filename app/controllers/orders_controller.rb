class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  def index
    @orders = current_user.orders
    render 'show'
  end

  # GET /orders/1
  def show
    @orders = current_user.orders
    @subtotal = 0
    @tax = 0
    @total = 0
    @orders.each do |order|
    @subtotal += order.subtotal
    @tax += order.tax
    @total += order.total
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # PATCH/PUT /orders/1
  def update
    respond_to do |format|
      if @order.update order_params
        format.html { redirect_to @order, 
                      notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, 
                      status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, 
                    notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_order
    @order = Order.find params[:id]
  end

  def order_params
    params.fetch :order, {}
  end
end
