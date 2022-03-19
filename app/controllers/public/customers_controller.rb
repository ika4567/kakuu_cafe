class Public::CustomersController < ApplicationController
  def show
    @orders = current_customer.orders.order(created_at: :desc).limit(10)
  end

  def edit
  end
end
