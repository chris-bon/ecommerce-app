class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :calculate_cart_count

  def authenticate_admin!
    redirect_to '/' unless current_user && current_user.admin
  end

  def calculate_cart_count
    if current_user && order = current_user.orders.find_by(completed: false)
      @cart_count = order.carted_products.count
    end
  end
end
