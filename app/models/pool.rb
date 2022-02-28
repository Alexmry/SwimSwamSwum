class Pool < ApplicationRecord
  belongs_to :user
  has_many :users, through: :bookings

  has_many :bookings, dependent: :destroy

  validates :price, presence: true
  validates :address, :name, :size, presence: true
end
