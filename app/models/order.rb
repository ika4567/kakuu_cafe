class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details
  accepts_nested_attributes_for :order_details, allow_destroy: true

  belongs_to :customer

  enum order_system: { layaway: 0, take_out: 1}
  enum order_status: { reservation: 0, complete: 1, cancel: 2}

  validates_associated :order_details
  validates :order_details, presence: true
  validate :time_check_current
  validate :time_check_finish

  def time_check_current
    errors.add(:time, "現在より遅い時間を選択してください") if self.time < Time.current - 2.minute
  end

  def time_check_finish
    errors.add(:time, "18時より早い時間を選択してください") if self.time > Date.current + 18.hour
  end

end
