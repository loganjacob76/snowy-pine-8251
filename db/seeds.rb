# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Airline.destroy_all
Flight.destroy_all
Passenger.destroy_all
PassengerFlight.destroy_all

airline = Airline.create!(name: 'Southwest')

flight1 = airline.flights.create!(number: '1234', date: '04/23/21', departure_city: 'Denver', arrival_city: 'Tampa')
flight2 = airline.flights.create!(number: '5678', date: '05/15/21' departure_city: 'Tampa', arrival_city: 'Pittsburgh')

passenger1 = Passenger.create!(name: 'John Doe', age: 45)
passenger2 = Passenger.create!(name: 'Jane Doe', age: 44)
passenger3 = Passenger.create!(name: 'Joe Schmoe', age: 22)
passenger4 = Passenger.create!(name: 'Jane Schmoe', age: 17)

PassengerFlight.create(flight: flight1, passenger: passenger1)
PassengerFlight.create(flight: flight1, passenger: passenger2)
PassengerFlight.create(flight: flight1, passenger: passenger3)
PassengerFlight.create(flight: flight1, passenger: passenger4)

PassengerFlight.create(flight: flight2, passenger: passenger1)
PassengerFlight.create(flight: flight2, passenger: passenger2)
PassengerFlight.create(flight: flight2, passenger: passenger3)