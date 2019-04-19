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
    it "returns a 404 status code if the driver doesn't exist" do

      # Arrange
      driver_id = 12345

      # Act
      get driver_path(driver_id)

      # Assert
      must_respond_with :not_found
    end

    it "works for a driver that DOES exit" do
      get driver_path(@driver.id)

      must_respond_with :ok
    end
  end

  describe "edit" do
    it "respond with OK for a real driver" do
      get edit_driver_path(@driver)
      must_respond_with :ok
    end

    it "responds with NOT FOUND for a fake driver" do
      driver_id = Driver.last.id + 1
      get edit_driver_path(driver_id)
      must_respond_with :not_found
    end
  end

  describe "update" do
    let (:driver_data) {
      {
        driver: {
          name: "changed name",
        },
      }
    }
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

    it "responds with BAD REQUEST for bad data" do
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
    it "removes the driver from the database" do
      # Act
      expect {
        delete driver_path(@driver)
      }.must_change "Driver.count", -1

      # Assert
      must_respond_with :redirect
      must_redirect_to drivers_path

      destroyed_driver = Driver.find_by(id: @driver.id)
      expect(destroyed_driver).must_be_nil
    end

    it "returns a 404 if the driver doesn't exist" do
      # Arrange
      driver_id = 90001

      # Assumptions
      expect(Driver.find_by(id: driver_id)).must_be_nil

      # Act
      expect {
        delete driver_path(driver_id)
      }.wont_change "Driver.count"

      # Assert
      must_respond_with :not_found
    end
  end
end
