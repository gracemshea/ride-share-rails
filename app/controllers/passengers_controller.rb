class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def new
    @passenger = Passenger.new
  end

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def create
    @passenger = Passenger.new(Passenger_params)
  end

  def update
  end

  def destroy
  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :vin)
  end
end
