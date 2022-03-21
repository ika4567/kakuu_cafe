class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  
  enum order_system: { layaway: 0, take_out: 1}
  
end
