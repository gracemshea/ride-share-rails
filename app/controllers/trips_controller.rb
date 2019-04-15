class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def create
    @trip = Trip.new(trip_params)
  end

  def update
  end

  def destroy
  end

  private

  def trip_params
    return params.require(:trip).permit(:name, :vin)
  end
end
