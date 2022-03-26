class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details
  accepts_nested_attributes_for :order_details, allow_destroy: true

  belongs_to :customer

  enum order_system: { layaway: 0, take_out: 1}
  enum order_status: { reservation: 0, complete: 1, cancel: 2}

  validates_associated :order_details
  validate :time_check_current, on: :create
  validate :time_check_last

  def time_check_current
    if self.time < Time.current - 2.minute
      errors.add(:time, "現時刻から18時までの時間を選択してください")
    end
  end

  def time_check_last
    if self.time > Date.current + 18.hour
      errors.add(:time, "現時刻から18時までの時間を選択してください")
    end
  end

end
