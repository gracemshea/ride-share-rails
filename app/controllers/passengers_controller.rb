class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    @passenger = Passenger.find_by(id: params[:id])
    if !@passenger
      redirect_to passengers_path(@passenger), status: :not_found, :flash => { :error => "Could not find passenger with id: #{params[:id]}" }
    end
  end

  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      redirect_to passenger_path(@passenger.id), { :flash => { :success => "Passenger has been added" } }
    else
      render :new, status: :bad_request, :flash => { :error => "Failed to add passenger" }
    end
  end

  def new
    @passenger = Passenger.new
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])
    if !@passenger
      redirect_to passengers_path, status: :not_found, :flash => { :error => "Could not find passenger with id: #{params[:id]}" }
    end
  end

  def update
    @passenger = Passenger.find_by(id: params[:id])
    if @passenger
      if @passenger.update passenger_params
        redirect_to passenger_path(@passenger.id), { :flash => { :success => "Passenger has been updated" } }
      else
        redirect_to edit_passenger_path, status: 400, :flash => { :error => "Failed to update passenger" }
      end
    else
      redirect_to root_path, status: 404, :flash => { :error => "Could not find passenger with id: #{params[:id]}" }
    end
  end

  def destroy
    passenger = Passenger.find_by(id: params[:id])

    if passenger
      if passenger.destroy
        redirect_to passengers_path, { :flash => { :success => "Passenger has been removed" } }
      else
        redirect_to passengers_path, { :flash => { :error => "Failed to delete passenger" } }
      end
    else
      redirect_to passengers_path, status: 404, :flash => { :error => "Could not find passenger with id: #{params[:id]}" }
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
