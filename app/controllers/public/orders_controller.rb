class Public::OrdersController < ApplicationController
  def note
  end

  def new
    @today = Date.current.strftime('%-m月%d日')
    @product = Product.where(product_status: "on_sale")
    @order = Order.new
    @order.order_details.build
  end

  def confirm
    params[:order][:order_details_attributes].each do |k,v|
      if v["reservation_quantity"].to_i < 1
        params[:order][:order_details_attributes].delete(k)
      end
    end
    @order = current_customer.orders.new(order_params)
    # binding.pry
    # if @order.invalid?
    #   render :new
    # end
  end

  def create
    @order = current_customer.orders.new(order_params)
    # binding.pry
    if @order.save
      @order.products.each do |product|
        @order.order_details.each do |detail|
          if detail.product_id == product.id
            product.update(max_quantity: product.max_quantity - detail.reservation_quantity)
          end
        end
      end
    else
      render :new
    end
    # binding.pry
    redirect_to orders_thanks_path
  end

  def edit
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  def update
    @order = Order.find(params[:id])
    # binding.pry
    @order.update(order_params)
    redirect_to my_page_path
  end

  def cancel
    @order = Order.find(params[:id])
    # binding.pry
    @order.products.each do |product|
      @order.order_details.each do |detail|
        if detail.product_id == product.id
          product.update(max_quantity: product.max_quantity + detail.reservation_quantity)
        end
      end
    end
    @order.update(order_status: "cancel")
    @order.products.each do |product|
      @order.order_details.each do |detail|
        if detail.product_id == product.id
          product.update(max_quantity: product.max_quantity + detail.reservation_quantity)
        end
      end
    end
    redirect_to my_page_path
  end

  def thanks
  end

  def index
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :order_system, :time, :note, order_details_attributes: [:id, :order_id, :product_id, :reservation_quantity])
  end

end
