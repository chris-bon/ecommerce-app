class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def create
    Product.new( name: params[:name],        price: params[:price], 
                image: params[:image], description: params[:description]).save
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    Product.find_by(id: params[:id]).update( name: params[:name],
                                            price: params[:price],
                                            image: params[:image], 
                                      description: params[:description])
    #@product = Product.find_by(id: params[:id])
    #@product.name = params[:name]
    #@product.price = params[:price]
    #@product.image = params[:image]
    #@product.description = params[:description]
    #@product.save
  end

  def destroy
    Product.find_by(id: params[:id]).destaroy
  end
end
