class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @products = Product.where(product_status: "1").order(:product_name)
    @orders = Order.where("created_at >= ?", Date.today)
    @today = Date.current.strftime('%-m月%d日')
  end
end
