class Public::OrdersController < ApplicationController
  def note
  end

  def new
    @today = Date.current.strftime('%-m月%d日')
    @product = Product.where(product_status: "on_sale")
    @order = Order.new
    @order_detail = OrderDetail.new
  end

  def create
    # OrderDetail
    products = Product.where(product_status: "on_sale")
    products.each do |product|
      @order_detail = OrderDetail.new(order_detail_params)
      @order_detail.order_id = current_customer.orders.id
      @order_detail.product_id = product.id
      @order_detail.save
    end
    # Order
    @order = current_customer.orders.new(order_params)
    @order.save
  end

  def thanks
  end

  def index
  end

  def edit
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :order_system, :time, :note)
  end

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :product_id, :reservation_quantity)
  end
end
