class Product < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details
  
  enum product_status: { discontinued: 0, on_sale: 1}
  
end
