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
    @order = current_customer.orders.new(order_params)
    @order_details = @order.order_details
    # binding.pry
    render :confirm
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    # binding.pry
    redirect_to orders_thanks_path
  end

  def edit
    @product = Product.where(product_status: "on_sale")
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to my_page_path
  end
  
  def cancel
    @order = Order.find(params[:id])
    @order.update(order_status: "cancel")
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
