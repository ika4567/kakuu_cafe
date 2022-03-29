class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!, except: [:note]

  def note
  end

  def new
    @products = Product.where(product_status: "on_sale")
    @order = Order.new
    # @order.order_details.build
  end

  def confirm
    params[:order][:order_details_attributes].each do |k,v|
      if v["reservation_quantity"].to_i < 1
        params[:order][:order_details_attributes].delete(k)
      end
    end
    @order = current_customer.orders.new(order_params)
    if @order.invalid?
      @products = Product.where(product_status: "on_sale")
      render :new
    end
  end

  def create
    @order = current_customer.orders.new(order_params)
    is_validates = @order.is_save_with_product(order_params[:order_details_attributes])

    if is_validates.include?(false)
      @products = Product.where(product_status: "on_sale")
      flash[:alert] = "売り切れ、もしくはご希望の数量をご用意できない商品が含まれているため、予約できませんでした。"
      render :new
    else
      if @order.save!
        reservation_quantities = @order.order_details.pluck(:reservation_quantity)
        @order.products.each_with_index do |product, i|
          product.update!(max_quantity: product.max_quantity - reservation_quantities[i])
        end
        redirect_to orders_thanks_path
      else
        @products = Product.where(product_status: "on_sale")
        render :new
      end
    end
  end

  #上記でエラーが出た場合は以下のトランザクションを使用

  # def create
  #   @order = current_customer.orders.new(order_params)

  #   @order.transaction do
  #     if @order.save!
  #       reservation_quantities = @order.order_details.pluck(:reservation_quantity)
  #       @order.products.each_with_index do |product, i|
  #         if(product.max_quantity >= reservation_quantities[i])
  #           product.update!(max_quantity: product.max_quantity - reservation_quantities[i])
  #           redirect_to orders_thanks_path
  #         else
  #           @products = Product.where(product_status: "on_sale")
  #           #redirect_to new_order_path
  #           render :new
  #           raise ActiveRecord::Rollback
  #         end
  #       end
  #     # else
  #     end
  #   end
  # rescue => e
  #   puts e
  # end

    # if @order.save!
    #   @order.products.each do |product|
    #     @order.order_details.each do |detail|
    #       if detail.product_id == product.id
    #         product.update(max_quantity: product.max_quantity - detail.reservation_quantity)
    #       end
    #     end
    #   end
    #   redirect_to orders_thanks_path
    # else
    #   @product = Product.where(product_status: "on_sale")
    #   render :new
    # end
  #end

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
    @order.transaction do
      if @order.update!(order_params)
        order_detail_params.each do |order_detail_param|
          product = Product.find(order_detail_param[1][:product_id])
          if old_reservetion_quantity[order_detail_param[1][:id]] != order_detail_param[1][:reservation_quantity].to_i
            if product.max_quantity >= order_detail_param[1][:reservation_quantity].to_i
              quantity = old_reservetion_quantity[order_detail_param[1][:id]] - order_detail_param[1][:reservation_quantity].to_i
              product.max_quantity += quantity
              product.save!
            end
          else
          end
        end
        flash[:success] = '予約内容を変更しました!!'
        redirect_to my_page_path
      end
    end
  rescue => e
    puts e
    flash[:alert] = "ご希望の数量をご用意できない商品が含まれているため、変更処理ができませんでした。"
    @order_details = @order.order_details.all
    render :edit
  end

  def cancel
    @order = Order.find(params[:id])
    @order.products.each do |product|
      @order.order_details.each do |detail|
        if detail.product_id == product.id
          product.update(max_quantity: product.max_quantity + detail.reservation_quantity)
        end
      end
    end
    @order.update(order_status: "cancel")
    flash[:cancel] = '予約をキャンセルしました'
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
