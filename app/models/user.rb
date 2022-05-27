class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :pools
  has_many :bookings
  has_many :messages
  



  # has_many :bookings, through: :bookings, source: :booking_notifications
  # has_many :nft_comments, through: :nfts, source: :comments
  # has_many :incoming_notifications, through: :nft_comments, source: :notification
  
  # has_many :booking_requests, source: :bookings
  # has_many :incoming_notifications, through: :booking_requests, source: :booking_notification

  has_many :incoming_notifications, through: :bookings, source: :booking_notification, dependent: :destroy


  # def mark_notications_as_seen_for_nft(booking_id)
  #   Booking.where(booking_id: booking_id, user_id: self.id).each do |booking|
  #     booking.booking_notification.update(seen: true)
  #   end
  # end



end
