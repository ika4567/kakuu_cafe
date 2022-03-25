class Admin::ProductsController < ApplicationController
  def index
    @products = Product.order("product_name")
    @product = Product.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    # binding.pry
    if @product.save
      redirect_to admin_products_path
    else
      @products = Product.order("product_name")
      render :index
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def status
    @product = Product.find(params[:id])
    # binding.pry
    if @product.product_status == "discontinued"
      @product.update(product_status: "on_sale")
    elsif @product.product_status == "on_sale"
      @product.update(product_status: "discontinued")
    end
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
