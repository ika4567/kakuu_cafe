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
    @product = Product.all
  end

  def on_sale
    @product = Product.find([:product][:id])
    @product.update(product_status: "on_sale")
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to admin_products_path
  end

  def destroy
    product = Product.find(params[:id])
    # binding.pry
    product.destroy
    redirect_to admin_products_path
  end

  private
  def product_params
    params.require(:product).permit(:product_name, :price, :max_quantity, :product_status)
  end

end
