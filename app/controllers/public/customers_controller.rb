class Public::CustomersController < ApplicationController
  def show
    @orders = current_customer.orders.where.not(order_status: "cancel").order(created_at: :desc).limit(10)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end
  
  def update
    @customer = Customer.find(current_customer.id)
    # binding.pry
    if @customer.update(customer_params)
      redirect_to my_page_path
    else
      render :edit
    end
  end
  
  def cancel
    @customer = Customer.find(current_customer.id)
    @customer.update(is_active: true)
    reset_session
    redirect_to root_path
  end
  
  private
  def customer_params
    params.require(:customer).permit(:name, :telephone_number, :email)
  end
end
