class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :orders, dependent: :destroy

  validates :name, presence: true
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/ }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
