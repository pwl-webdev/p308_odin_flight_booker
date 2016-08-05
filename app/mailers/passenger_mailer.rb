class PassengerMailer < ApplicationMailer
	default from: 'notifications@example.com'

	def reservation_confirmation_email(passenger)
		@passenger = passenger
		@flight = passenger.booking.flight
		@url = 'http://localhost:3000'
		mail(to: @passenger.email, subject: 'Reservation Confirmation')
	end
end
