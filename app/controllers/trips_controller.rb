class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find_by(id: params[:id])
    if !@trip
      redirect_to trips_path(@trip), :flash => { :error => "Could not find trip with id: #{params[:id]}" }
    end
  end

  # Do we even need new and create??

  # def create
  #   @trip = Trip.new(trip_params)
  #   if @trip.save
  #     redirect_to trip_path(@trip.id), { :flash => { :success => "Trip has been added" } }
  #   else
  #     redirect_to :new, :flash => { :error => "Failed to add trip" }
  #   end
  # end

  # def new
  #   @trip = Trip.new
  # end

  def edit
    @trip = Trip.find(params[:id])
    if !@trip
      redirect_to trips_path, :flash => { :error => "Could not find trip with id: #{params[:id]}" }
    end
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
