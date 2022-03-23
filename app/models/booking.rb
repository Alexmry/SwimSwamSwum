class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pool

  has_one :review

  validates :start_date, presence: true
  validates :end_date, presence: true
  
#   validate :end_date_after_start_date

#     private

#   def end_date_after_start_date
#       return if end_date.blank? || start_date.blank?

#       if end_date < start_date
#         # errors.add(:end_date, "must be after the start date")
#         notice: "must be after the start date :)"
#         # redirect_to booking_path(@booking.pool) , notice: "must be after the start date:)"
#       end
#   end

  has_one :notification

  after_create :create_notification


  def mark_notifications_as_seen
    comments = self.comments
    comments.each do |comment|
      comment.notification.update(seen: true)
    end 
  end

  private

  def create_notification
    Notification.create(user: booking.user, booking: self)
  end

end
