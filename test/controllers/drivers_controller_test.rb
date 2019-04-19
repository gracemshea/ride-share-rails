require "test_helper"

describe DriversController do
  before do
    @driver = Driver.create!(name: "Test Driver", vin: "0000000000")
  end
  describe "index" do
    it "can get index" do
      # Your code here

      # Arrange
      Driver.create!(
        name: "Test Name",
        vin: "000000",
      )

      # Act
      get drivers_path

      # Assert
      must_respond_with :ok
    end

    it "renders even if there are zero drivers" do
      # Arrange
      Driver.destroy_all

      # Act
      get drivers_path

      # Assert
      must_respond_with :ok
    end
  end

  describe "show" do
    # Your tests go here

    it "returns a 404 status code if the driver doesn't exist" do

      # Arrange
      driver_id = 12345

      # Act
      get driver_path(driver_id)

      # Assert
      must_respond_with :not_found
    end
  end

  describe "edit" do
    # Your tests go here
  end

  describe "update" do
    let (:driver_data) {
      {
        driver: {
          name: "changed name",
        },
      }
    }
    # Your tests go here
    it "changes the data on the model" do
      # Assumptions
      @driver.assign_attributes(driver_data[:driver])
      expect(@driver).must_be :valid?
      @driver.reload

      # Act
      patch driver_path(@driver), params: driver_data

      # Assert
      must_respond_with :redirect
      must_redirect_to driver_path(@driver)

      @driver.reload
      expect(@driver.name).must_equal(driver_data[:driver][:name])
    end

    it "responds with NOT FOUND for a fake driver" do
      # Arrange
      driver_data[:driver][:name] = ""

      # Assumptions
      @driver.assign_attributes(driver_data[:driver])
      expect(@driver).wont_be :valid?
      @driver.reload

      # Act
      patch driver_path(@driver), params: driver_data

      # Assert
      must_respond_with :bad_request
    end
  end

  describe "new" do
    it "returns status code 200" do
      get new_driver_path
      must_respond_with :ok
    end
  end

  describe "create" do
    it "creates a new driver" do

      # Arrange
      driver_data = {
        driver: {
          name: "Test Driver",
          vin: "12345678901234567",
        },
      }

      # Act
      expect {
        post drivers_path, params: driver_data
      }.must_change "Driver.count", +1

      # Assert
      must_respond_with :redirect
      must_redirect_to drivers_path

      driver = Driver.last
      expect(driver.name).must_equal driver_data[:driver][:name]
      expect(driver.vin).must_equal driver_data[:driver][:vin]
    end

    it "sends back bad_request if no driver data is sent" do
      # Arrange
      driver_data = {
        driver: {
          name: "",
        },
      }

      # Act
      expect {
        post drivers_path, params: driver_data
      }.wont_change "Driver.count"

      # Assert
      must_respond_with :bad_request
    end
  end

  describe "destroy" do
    # Your tests go here
  end
end
