class ProductsController < ApplicationController
  def index
    @products = params[:sort] ? Product.order(params[:sort]) : Product.all
  end

  def create
    Product.new(name: params[:name],  price: params[:price],
               image: params[:image], description: params[:description],
               supplier_id: params[:supplier][:supplier_id],
               user_id: current_user.id).save
    redirect_to "/products/#{product.id}"
    flash[:success] = 'New product created!'
  end

  def show
    @product = Product.find_by id: params[:id]
  end

  def edit
    @product = Product.find_by id: params[:id]
  end

  def update
    @product = Product.find_by id: params[:id]
    @product.update name: params[:name],        price: params[:price],
                   image: params[:image], description: params[:description]
    redirect_to "/products/#{@product.id}"
    flash[:info] = 'Update successful!'
  end

  def destroy
    Product.find_by(id: params[:id]).destroy
    redirect_to '/'
    flash[:danger] = 'Product deleted!'
  end
end