class Public::CustomersController < ApplicationController
  def show
    @orders = current_customer.orders.all
  end

  def edit
  end
end
