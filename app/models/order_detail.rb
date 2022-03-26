class OrderDetail < ApplicationRecord
  belongs_to :order
  # validates_presence_of :order
  belongs_to :product
  
end
