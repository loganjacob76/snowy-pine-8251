class Passenger < ApplicationRecord
  has_many :passenger_flights, dependent: :destroy
  has_many :flights, through: :passenger_flights

  def self.passengers_by_airline(airline)
    joins(:flights)
    .where('flights.airline_id = ?', airline.id)
    .where('passengers.age >= 18')
    .distinct
  end
end
