class TripController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
    @driver = @trip.driver
    @rider = @trip.rider
  end
end
