class AirlinesController < ApplicationController
  def show
    @airline = Airline.find(params[:id])
    @passengers = Passenger.all
  end
end