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
    
    @order = current_customer.orders.new
    @order.customer_id = current_customer.id
  end

  def thanks
  end

  def index
  end

  def edit
  end
end
