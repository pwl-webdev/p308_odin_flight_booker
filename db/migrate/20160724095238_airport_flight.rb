class AirportFlight < ActiveRecord::Migration[5.0]
  def change
  	change_table :flights do |t|
  		t.belongs_to :from_airport
  		t.belongs_to :to_airport
  	end
  end
end
