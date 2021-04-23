class Passenger < ApplicationRecord
  has_many :passenger_flights, dependent: :destroy
  has_many :flights, through: :passenger_flights

  # works for user story 3
  def self.passengers_by_airline(airline)
    joins(:flights)
    .where('flights.airline_id = ?', airline.id)
    .where('passengers.age >= 18')
    .distinct
  end

  #building for extension
  # def self.passengers_by_airline(airline)
  #   t = joins(:flights)
  #   .where('flights.airline_id = ?', airline.id)
  #   .where('passengers.age >= 18')
  #   .select('passengers.*, flights.*, count(passengers.*) as total_appearances')
  #   .group('passengers.id')

  #   binding.pry
  # end
end
