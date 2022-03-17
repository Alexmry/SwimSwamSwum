class BookingsController < ApplicationController

    def index
        @bookings = current_user.bookings


        @pools_bookings = Booking.all.select do |booking|
            booking.pool.user == current_user && booking.confirmed == nil
        end

        @accepted_bookings = current_user.bookings.select do |booking|
            booking.confirmed == true #method not working yet => it works, just forgot to save in the console (jonas_booking.save)
        end
        

        @pending_bookings = current_user.bookings.select do |booking|
            booking.confirmed == nil
        end


    end

    def create 
        @booking = Booking.new(booking_params)
        @pool = Pool.find(params[:pool_id])
        @booking.pool = @pool
        @booking.user = current_user
        @booking.confirmed = nil
        if @booking.save!
            redirect_to bookings_path , notice: "Made a new booking! We will let you know if the owner accepts :)"
        end
    end

    def update
        @booking_request = Booking.find(params[:id])
        @booking_request.confirmed = true
        @booking_request.save
        @pool_bookings = Booking.all.select do |booking|
            booking.pool.user == current_user && booking.confirmed = false
        end
        redirect_to bookings_path
    end

    def destroy
        @booking = Booking.find(params[:id])
        @booking.destroy
        redirect_to bookings_path
    end

    private

    def booking_params
        params.require(:booking).permit(:start_date, :end_date)
    end
end
