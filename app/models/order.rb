class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details
  accepts_nested_attributes_for :order_details, allow_destroy: true
  
  belongs_to :customer

  enum order_system: { layaway: 0, take_out: 1}
  enum order_status: { reservation: 0, complete: 1, cancel: 2}

end
