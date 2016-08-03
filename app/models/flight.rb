class Flight < ApplicationRecord
	belongs_to :from_airport, :class_name => "Airport"
	belongs_to :to_airport,   :class_name => "Airport"
	has_many :bookings
	has_many :passengers, through: :bookings

	def start_time_formatted
    	start_time.strftime("%d/%m/%Y")
  	end
  	def end_time_formatted
    	end_time.strftime("%d/%m/%Y")
  	end

  	def self.date_list
		dates = Flight.all.order(start_time: :asc)
		dates.map {|n| n.start_time.strftime("%d/%m/%Y") }.uniq
	end
	def passenger_options
	end
end
