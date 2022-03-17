class Admin::HomesController < ApplicationController
  def top
    @products = Product.where(product_status: "1")
    @orders = Order.where("created_at >= ?", Date.today)
    # @orders.each do |order|
    # end
    @today = Date.current.strftime('%m月%d日')
  end
end
