class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @customer = Customer.find(params[:id])
  end
end
