class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details
  accepts_nested_attributes_for :order_details, allow_destroy: true

  validates_associated :order_details
  validate :validate_time_check_current, on: :create
  validate :validate_time_check_last

  def validate_time_check_current
    if self.time.strftime("%H:%M") < (Time.current - 5.minutes).strftime("%H:%M")
      errors.add(:time, "は現時刻よりも後の時間を選択してください")
    end
  end

  def validate_time_check_last
    if self.time.strftime("%H:%M") > "18:00"
      errors.add(:time, "は18時までの時間を選択してください")
    end
  end

  def is_save_with_product(order_details)
    is_validates = []
    order_details.each do |detail|
      product_id = detail[1][:product_id].to_i
      reservation_quantity = detail[1][:reservation_quantity].to_i
      product = Product.find(product_id)
      if product.max_quantity >= reservation_quantity
        is_validates.push(true)
      else
        is_validates.push(false)
      end
    end
    return is_validates
  end

  enum order_system: { layaway: 0, take_out: 1}
  enum order_status: { reservation: 0, complete: 1, cancel: 2}

  def date_today
    Date.current.strftime('%-m月%d日')
  end
end
