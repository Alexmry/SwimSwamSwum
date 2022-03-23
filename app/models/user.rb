class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :pools
  has_many :bookings




  has_many :bookings_booking_notifications, through: :bookings, source: :booking_notifications
  has_many :incoming_notifications, through: :bookings_booking_notifications, source: :notification


  # def mark_notications_as_seen_for_nft(booking_id)
  #   Booking.where(booking_id: booking_id, user_id: self.id).each do |booking|
  #     booking.booking_notification.update(seen: true)
  #   end
  # end



end
