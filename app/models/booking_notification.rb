class BookingNotification < ApplicationRecord
  belongs_to :user
  belongs_to :booking

# scope for notification unseen (we call it unseen_notifications because they are not seen)
  scope :unseen_notifications, -> { where(seen: false) }
  

end
