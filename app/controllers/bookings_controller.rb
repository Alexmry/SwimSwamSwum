class BookingsController < ApplicationController

    def index
        
        @bookings = current_user.bookings


        @pools_bookings = Booking.all.select do |booking|
            booking.pool.user == current_user && booking.confirmed == nil
        end

        @accepted_bookings = current_user.bookings.select do |booking|
            booking.confirmed == true #method not working yet => it works, just forgot to save in the console (jonas_booking.save)
        end
        
        @denied_bookings = current_user.bookings.select do |booking|
            booking.confirmed == false
        end
        
        
        @pending_bookings = current_user.bookings.select do |booking|
            booking.confirmed == nil
        end
        
        # raise
        # @bookings.mark_notifications_as_seen
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
        # @booking_request.confirmed = true
        if params[:confirmed] == "true" #  <%= link_to "Reject Request", booking_path(booking, confirmed: false), method: :patch %>
            @booking_request.confirmed = true
        else
            @booking_request.confirmed = false
        end
        @booking_request.save
        # @pool_bookings = Booking.all.select do |booking|
        #     booking.pool.user == current_user && booking.confirmed = false
        # end
        redirect_to bookings_path

        # raise
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
