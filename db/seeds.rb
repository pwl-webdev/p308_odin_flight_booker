# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Airport.create!(name: "Beijing",
				code: "PEK")

Airport.create!(name: "Tokyo",
				code: "NRT")

Airport.create!(name: "Seoul",
				code: "SEL")

Airport.create!(name: "Sydney",
				code: "SYD")

Airport.create!(name: "Hong Kong",
				code: "HKG")

Airport.create!(name: "Kuala Lumpur",
				code: "KUL")

f_airports = Airport.all
t_airports = Airport.all

date1 = Time.now
date2 = 7.days.from_now

f_airports.each do |f|
	t_airports.each do |t|
		10.times do
			start_time = Time.at((date2.to_f - date1.to_f)*rand + date1.to_f)
			end_time = start_time + rand(5).hours
			if f.name != t.name
				Flight.create!(:start_time => start_time,
						  	  :end_time => end_time,
						  	  :from_airport => f,
						  	  :to_airport => t)
			end
		end
	end
end