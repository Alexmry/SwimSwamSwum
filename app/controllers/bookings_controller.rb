class BookingsController < ApplicationController

    def booking
        @bookings = Booking.all
    end

end
