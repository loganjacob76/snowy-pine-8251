class PassengerFlightsController < ApplicationController
  def destroy
    pf = PassengerFlight.find_by(flight_id: params[:flight_id], passenger_id: params[:id])
    pf.destroy

    redirect_to flights_path
  end
end