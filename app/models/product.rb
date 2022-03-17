class Product < ApplicationRecord
  
  enum product_status: { discontinued: 0, on_sale: 1}
  
end
