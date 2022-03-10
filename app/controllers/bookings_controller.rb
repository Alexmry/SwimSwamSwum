class BookingsController < ApplicationController

    def index
        @bookings = current_user.bookings
    end

    def create 
        @booking = Booking.new(booking_params)
        @pool = Pool.find(params[:pool_id])
        @booking.pool = @pool
        @booking.user = current_user
        if @booking.save!
            redirect_to bookings_path , notice: "Made a new booking! :)"
        end
    end

    private

    def booking_params
        params.require(:booking).permit(:start_date, :end_date)
    end
end
