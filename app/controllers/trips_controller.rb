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
    @trip = Trip.find_by(id: params[:id])
    if @trip
      if @trip.update trip_params
        redirect_to trip_path(@trip.id), { :flash => { :success => "Trip has been updated" } }
      else
        redirect_to :edit, :flash => { :error => "Failed to update trip" }
      end
    else
      redirect_to root_path, status: 302, :flash => { :error => "Could not find trip with id: #{params[:id]}" }
    end
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])
    if @trip
      if @trip.destroy
        redirect_to root_path, { :flash => { :success => "Trip has been removed" } }
      else
        redirect_to root_path, { :flash => { :error => "Failed to delete trip" } }
      end
    else
      redirect_to root_path, status: 302, :flash => { :error => "Could not find trip with id: #{params[:id]}" }
    end
  end

  private

  def trip_params
    return params.require(:trip).permit(
             :passenger_id,
             :driver_id,
             :date,
             :rating,
             :cost
           )
  end
end
