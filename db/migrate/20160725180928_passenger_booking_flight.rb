class PassengerBookingFlight < ActiveRecord::Migration[5.0]
  def change
  	change_table :bookings do |t|
  		t.belongs_to :flight
  	end
  	change_table :passengers do |t|
  		t.belongs_to :booking
  	end
  end
end
