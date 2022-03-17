class Admin::ProductsController < ApplicationController
  def index
    @products = Product.order("product_name")
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to admin_products_path
  end

  def sale
  end

  def edit
  end

  private
  def product_params
    params.permit(:product_name, :price, :max_quantity)
  end

end
