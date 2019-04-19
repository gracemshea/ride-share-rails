class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    driver_id = params[:id]

    @driver = Driver.find_by(id: driver_id)

    unless @driver
      head :not_found
    end
  end

  def new
    @driver = Driver.new
  end

  def edit
    driver_id = params[:id]

    @driver = Driver.find_by(id: driver_id)
  end

  def create
    @driver = Driver.new(driver_params)

    successful = @driver.save

    if successful
      redirect_to drivers_path
    else
      render :new, status: :bad_request
    end
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
