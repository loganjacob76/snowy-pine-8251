require 'rails_helper'

RSpec.describe 'flights index page' do
  before :each do
    @airline = Airline.create!(name: 'Southwest')

    @flight1 = @airline.flights.create!(number: '1234', date: '04/23/21', departure_city: 'Denver', arrival_city: 'Tampa')
    @flight2 = @airline.flights.create!(number: '5678', date: '05/15/21' departure_city: 'Tampa', arrival_city: 'Pittsburgh')
    
    @passenger1 = Passenger.create!(name: 'John Doe', age: 45)
    @passenger2 = Passenger.create!(name: 'Jane Doe', age: 44)
    @passenger3 = Passenger.create!(name: 'Joe Schmoe', age: 22)
    @passenger4 = Passenger.create!(name: 'Jane Schmoe', age: 17)
    
    PassengerFlight.create(flight: @flight1, passenger: @passenger1)
    PassengerFlight.create(flight: @flight1, passenger: @passenger2)
    PassengerFlight.create(flight: @flight1, passenger: @passenger3)
    PassengerFlight.create(flight: @flight1, passenger: @passenger4)
    
    PassengerFlight.create(flight: @flight2, passenger: @passenger1)
    PassengerFlight.create(flight: @flight2, passenger: @passenger2)
    PassengerFlight.create(flight: @flight2, passenger: @passenger3)
  end
  
  context 'you visit the flights index page' do
    it 'you see a list of all flight numbers & their airlines' do
      expect(page).to have_content("#{@flight1.number} - #{@airline.name}")
      expect(page).to have_content("#{@flight2.number} - #{@airline.name}")
    end

    it 'under each flight number you see the names of all the passengers on that flight' do
      within '#1234' do
        expect(page).to have_content(@passenger1.name)
        expect(page).to have_content(@passenger2.name)
        expect(page).to have_content(@passenger3.name)
        expect(page).to have_content(@passenger4.name)
      end

      within '#5678' do
        expect(page).to have_content(@passenger1.name)
        expect(page).to have_content(@passenger2.name)
        expect(page).to have_content(@passenger3.name)
      end
    end
  end
end