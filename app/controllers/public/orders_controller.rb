class Public::OrdersController < ApplicationController
  def note
  end

  def new
    @today = Date.current.strftime('%-m月%d日')
    @product = Product.where(product_status: "on_sale")
  end

  def thanks
  end

  def index
  end

  def edit
  end
end
