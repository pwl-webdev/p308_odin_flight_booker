class FlightsController < ApplicationController
	def index
		@flight = Flight.new
		@dates = Flight.date_list

		#@from_airport  = flight_params[:from_airport_id]
		#@to_airport = flight_params[:to_airport_id]
		#@flight_date = DateTime.parse(flight_params[:start_time])

		if params[:commit] == "Search"
			@from_airport  = flight_params[:from_airport_id]
			@to_airport = flight_params[:to_airport_id]
			@flight_date = DateTime.parse(flight_params[:start_time])

			@matching_flights = Flight.where("from_airport_id = ? and to_airport_id = ? and start_time between ? and ?", @from_airport, @to_airport, @flight_date, @flight_date + 1.day)
			@matching_flights.order!(start_time: :asc)
		else
			@matching_flights = nil
		end
	end
	private
	def flight_params
	  	#puts params
	  	#debugger
	  	params.require(:flight).permit(:from_airport_id, :to_airport_id, :start_time)
	end
end
