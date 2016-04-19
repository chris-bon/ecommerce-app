class ProductsController < ApplicationController
  def create
    Product.new(name: params[:name],  price: params[:price],
               image: params[:image], description: params[:description]).save
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
