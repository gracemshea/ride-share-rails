class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def new
    @driver = Driver.new
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def create
    @driver = Driver.new(driver_params)
  end

  def update
  end

  def destroy
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end
