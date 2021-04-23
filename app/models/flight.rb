class Flight < ApplicationRecord
  belongs_to :airline
  has_many :passenger_flights, dependent: :destroy
  has_many :passengers, through: :passenger_flights
end
