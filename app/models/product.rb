class Product < ApplicationRecord
  has_many :order_details, dependent: :destroy
  
  enum product_status: { discontinued: 0, on_sale: 1}
  
end
