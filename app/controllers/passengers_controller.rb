class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all

  def show
    @passenger = Passenger.find_by(id: params[:id])
    if !@passenger
      redirect_to passengers_path(@passenger), :flash => { :error => "Could not find passenger with id: #{params[:id]}" }
    end
  end

  def create
    @passenger = Passenger.new(passenger_params)
      if @passenger.save
        redirect_to passenger_path(@passenger.id), { :flash => { :success => "Passenger has been added" } }
      else
        redirect_to :new, :flash => { :error => "Failed to add passenger" }
      end
  end

  def new
    @passenger = Passenger.new
  end

  def edit
    @passenger = Passenger.find(params[:id])
    if !@passenger
      redirect_to passengers_path, :flash => { :error => "Could not find passenger with id: #{params[:id]}" }
    end
  end

  def update
    @passenger = Passenger.find_by(id: params[:id]))
    if @passenger
      if @passenger.update passenger_params
        redirect_to trip_path(@trip.id), { :flash => { :success => "Passenger has been updated" } }
      else
        redirect_to :edit, :flash => { :error => "Failed to update passenger" }
      end
    else
      redirect_to root_path, status: 302, :flash => { :error => "Could not find passenger with id: #{params[:id]}" }
    end
  end

  def destroy
    @passenger = Passenger.find_by(id: params[:id])
    if @passenger
      if @passenger.destroy
        redirect_to root_path, { :flash => { :success => "Passenger has been removed" } }
      else
        redirect_to root_path, { :flash => { :error => "Failed to delete passenger" } }
      end
    else
      redirect_to root_path, status: 302, { :flash => { :error => "Could not find passenger with id: #{params[:id]}" } }
    end
  end

  private

  def passenger_params
    return params.require(:passenger).permit(
      :name,
      :phone_num,
    )
  end
end
