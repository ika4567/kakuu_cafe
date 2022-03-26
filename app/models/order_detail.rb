class OrderDetail < ApplicationRecord
  belongs_to :order, inverse_of: :order_details
  # validates_presence_of :order
  belongs_to :product
  
end
