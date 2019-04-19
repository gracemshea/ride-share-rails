require "test_helper"

describe PassengersController do
  before do
    @passenger = Passenger.create!(name: "Test Passenger", phone_num: "000-000-0000")
  end
  describe "index" do
    it "can get index" do
      # Your code here

      # Arrange
      Passenger.create!(
        name: "Test Name",
        phone_num: "000-000-0000",
      )

      # Act
      get passengers_path

      # Assert
      must_respond_with :ok
    end

    it "renders even if there are zero passengers" do
      # Arrange
      Passenger.destroy_all

      # Act
      get passengers_path

      # Assert
      must_respond_with :ok
    end
  end

  describe "show" do
    it "returns a 404 status code if the passenger doesn't exist" do

      # Arrange
      passenger_id = 12345

      # Act
      get passenger_path(passenger_id)

      # Assert
      must_respond_with :not_found
    end

    it "works for a passenger that DOES exit" do
      get passenger_path(@passenger.id)

      must_respond_with :ok
    end
  end

  describe "edit" do
    it "respond with OK for a real passenger" do
      get edit_passenger_path(@passenger)
      must_respond_with :ok
    end

    it "responds with NOT FOUND for a fake passenger" do
      passenger_id = Passenger.last.id + 1
      get edit_passenger_path(passenger_id)
      must_respond_with :not_found
    end
  end

  describe "update" do
    let (:passenger_data) {
      {
        passenger: {
          name: "changed name",
        },
      }
    }
    it "changes the data on the model" do
      # Assumptions
      @passenger.assign_attributes(passenger_data[:passenger])
      expect(@passenger).must_be :valid?
      @passenger.reload

      # Act
      patch passenger_path(@passenger), params: passenger_data

      # Assert
      must_respond_with :redirect
      must_redirect_to passenger_path(@passenger)

      @passenger.reload
      expect(@passenger.name).must_equal(passenger_data[:driver][:name])
    end

    it "responds with NOT FOUND for a fake passenger" do
      # Arrange
      passenger_data[:passenger][:name] = ""

      # Assumptions
      @passenger.assign_attributes(passenger_data[:passenger])
      expect(@passenger).wont_be :valid?
      @passenger.reload

      # Act
      patch passenger_path(@passenger), params: passenger_data

      # Assert
      must_respond_with :bad_request
    end

    it "responds with BAD REQUEST for bad data" do
      # Arrange
      driver_data[:passenger][:name] = ""

      # Assumptions
      @passenger.assign_attributes(passenger_data[:passenger])
      expect(@passenger).wont_be :valid?
      @passenger.reload

      # Act
      patch passenger_path(@passenger), params: passenger_data

      # Assert
      must_respond_with :bad_request
    end
  end

  describe "new" do
    # Your tests go here
  end

  describe "create" do
    # Your tests go here
  end

  describe "destroy" do
    # Your tests go here
  end
end
