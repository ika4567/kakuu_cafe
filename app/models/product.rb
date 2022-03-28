class Product < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details

  validates :product_name, presence: true
  validates :price, presence: true
  validates :max_quantity, presence: true

  enum product_status: { discontinued: 0, on_sale: 1}

end
