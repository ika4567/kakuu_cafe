class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.order(created_at: :desc).page(params[:page])
  end
end
