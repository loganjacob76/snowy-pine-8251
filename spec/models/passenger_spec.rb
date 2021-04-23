require 'rails_helper'

RSpec.describe Passenger, type: :model do
  describe 'relationships' do
    it { should have_many :passenger_flights }
    it { should have_many :flights }
  end

  describe 'class methods' do
    describe '.passengers_by_airline' do
      before :each do
        @airline = Airline.create!(name: 'Southwest')
        @airline2 = Airline.create!(name: 'Spirit')

        @flight1 = @airline.flights.create!(number: '1234', date: '04/23/21', departure_city: 'Denver', arrival_city: 'Tampa')
        @flight2 = @airline.flights.create!(number: '5678', date: '05/15/21', departure_city: 'Tampa', arrival_city: 'Pittsburgh')
        @flight3 = @airline2.flights.create!(number: '8520', date: '12/12/21', departure_city: 'Latrobe', arrival_city: 'Tampa')
        @flight4 = @airline.flights.create!(number: '9876', date: '06/15/21', departure_city: 'Pittsburgh', arrival_city: 'Tampa')
        
        @passenger1 = Passenger.create!(name: 'John Doe', age: 45)
        @passenger2 = Passenger.create!(name: 'Jane Doe', age: 44)
        @passenger3 = Passenger.create!(name: 'Joe Schmoe', age: 22)
        @passenger4 = Passenger.create!(name: 'Jane Schmoe', age: 17)
        @passenger5 = Passenger.create!(name: 'Snoopy', age: 47)
        
        PassengerFlight.create(flight: @flight1, passenger: @passenger1)
        PassengerFlight.create(flight: @flight1, passenger: @passenger2)
        PassengerFlight.create(flight: @flight1, passenger: @passenger3)
        PassengerFlight.create(flight: @flight1, passenger: @passenger4)
        
        PassengerFlight.create(flight: @flight2, passenger: @passenger1)
        PassengerFlight.create(flight: @flight2, passenger: @passenger2)
        PassengerFlight.create(flight: @flight2, passenger: @passenger4)

        PassengerFlight.create(flight: @flight3, passenger: @passenger5)

        PassengerFlight.create(flight: @flight4, passenger: @passenger2)
      end
    
      it 'returns a unique list of adult passengers with flights on a particular airline' do
        expect(Passenger.passengers_by_airline(@airline)).to eq([@passenger1, @passenger2, @passenger3]) # for user story 3
        # expect(Passenger.passengers_by_airline(@airline)).to eq([@passenger2, @passenger1, @passenger3]) # for extension
      end
    end
  end
end
