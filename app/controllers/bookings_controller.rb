class BookingsController < ApplicationController
	def new
		@flight_id = booking_params[:flight_id]
		@passenger_options = params[:passenger_options]
		@selected_flight = Flight.find(@flight_id)
		@booking = Booking.new
		params[:passenger_options].to_i.times { @booking.passengers.build }

	end
	def create
		@booking_hash = booking_params
		@booking = Booking.new(booking_params)
		if @booking.save
			redirect_to booking_path(@booking)
			@booking.passengers.each do |passenger|
				# to be enabled after mailer configuration
				# PassengerMailer.reservation_confirmation_email(passenger).deliver_now
			end
		end

	end
	def show
		@booking = Booking.find(params[:id])
	end

	private
	def booking_params
	  	params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
	end
end
