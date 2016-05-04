class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :search]

  # GET /products
  def index
    @products = if params[:sort]
                  Product.order params[:sort]
                elsif params[:category] = nil
                  Product.all.select { |product| product.categories.nil? }
                elsif params[:category]
                  Category.find_by(name: params[:category]).products
                else
                  Product.all
                end
  end

  # GET /products/:id
  def show
    @product = if params[:id] == 'random'
                 Product.all.sample
               else
                 Product.find_by id: params[:id]
               end
  end

  # POST /products
  def create
    Product.create name: params[:name], price: params[:price],
                   image: params[:image], description: params[:description], 
                   supplier_id: params[:supplier][:supplier_id],
                   user_id: current_user.id
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
end