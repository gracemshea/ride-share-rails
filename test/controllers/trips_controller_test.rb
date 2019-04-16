require "test_helper"

describe TripsController do
  describe "show" do
    it "can get a valid trip" do
      # Act
      get trip_path(trip.id)

      # Assert
      must_respond_with :success
  end

  describe "edit" do
    it "can get the edit page for an existing trip" do
      trip = Trip.first
      get edit_trip_path(trip)
    end

    it "will respond with redirect when attempting to edit a nonexistant trip" do
      get edit_trip_path(-1)

      # Assert
      must_respond_with :redirect
      expect(flash[:error]).must_equal "Could not find trip with id: -1"
    end
  end

  describe "update" do
    it "can update an existing trip" do
      # Arrange
      trip_id = Trip.last.id
      trip_hash = {
        trip: {
          passenger_id: 1,
          driver_id: 1,
          date: "20190416",
          rating: 5,
          cost: 15.75,
        },
      }

      # not finished!
  end

  describe "create" do
    # Your tests go here
  end

  describe "destroy" do
    # Your tests go here
  end
end
