class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!, except: [:note]

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
    if @order.invalid?
      @today = Date.current.strftime('%-m月%d日')
      @product = Product.where(product_status: "on_sale")
      render :new
    end
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
      redirect_to orders_thanks_path
    else
      @today = Date.current.strftime('%-m月%d日')
      @product = Product.where(product_status: "on_sale")
      @order = Order.new
      @order.order_details.build
      render :new
    end
  end

  def edit
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  def update
    @order = Order.find(params[:id])

    old_reservetion_quantity = {}
    order_detail_params = params[:order][:order_details_attributes]
    order_detail_params.each do |order_detail_param|
      order_detail = OrderDetail.find(order_detail_param[1][:id].to_i)
      old_reservetion_quantity[order_detail_param[1][:id]] = order_detail.reservation_quantity.to_i
    end

    if @order.update(order_params)
      order_detail_params.each do |order_detail_param|
        # binding.pry
        product = Product.find(order_detail_param[1][:product_id])
        quantity = old_reservetion_quantity[order_detail_param[1][:id]] - order_detail_param[1][:reservation_quantity].to_i
        product.max_quantity += quantity
        product.save
      end
      redirect_to my_page_path
    else
      @order_details = @order.order_details.all
      render :edit
    end
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
