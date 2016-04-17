class ProductsController < ApplicationController
  def show
    @product = Product.find_by id: params[:id]
  end

  def create
    product = Product.new name: params[:name],  
                         price: params[:price],
                         image: params[:image], 
                   description: params[:description]
    product.save
    redirect_to "/products/#{product.id}"
    flash[:success] = 'New product created!'
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
    @product = Product.find_by id: params[:id]
    @product.destroy
    redirect_to '/'
    flash[:danger] = 'Product deleted!'
  end
end
