require "test_helper"

describe TripsController do
  before do
    @trip = Trip.create!(passenger_id: 1, driver_id: 1, date: Date.today, rating: 5, cost: 15.75)
  end

  describe "index" do
    it "can get index" do

      # Act
      get trips_path

      # Assert
      must_respond_with :ok
    end

    it "renders even if there are zero trips" do
      # Arrange
      Trip.destroy_all

      # Act
      get trips_path

      # Assert
      must_respond_with :ok
    end
  end

  describe "show" do
    it "can get a valid trip" do
      @trip
      # Act
      get trip_path(@trip.id)

      # Assert
      must_respond_with :success
    end
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
      test_id = Trip.last.id
      trip_hash = {
        trip: {
          passenger_id: 1,
          driver_id: 1,
          date: Date.today,
          rating: 5,
          cost: 16.83,
        },
      }

      # Act-Assert
      expect {
        patch trip_path(id: test_id), params: trip_hash
      }.wont_change "Trip.count"

      updated_trip = Trip.find_by(id: test_id)

      expect(updated_trip.passenger_id).must_equal 1
      expect(updated_trip.date).must_equal Date.today
      expect(updated_trip.cost).must_equal 16.83

      must_respond_with :redirect
      must_redirect_to trip_path(test_id)
    end

    it "responds with NOT FOUND for a fake trip" do
      # Arrange
      fake_id = (Trip.all.last.id) + 5
      trip_hash = {
        trip: {
          passenger_id: 1,
          driver_id: 1,
          date: Date.today,
          rating: 5,
          cost: 16.83,
        },
      }

      # Act
      patch trip_path(id: fake_id), params: trip_hash

      # Assert
      must_respond_with :not_found
    end

    it "responds with BAD REQUEST for bad data" do
      # Arrange
      trip_id = Trip.all.last.id

      trip_hash = {
        trip: {
          passenger_id: "fake passenger",
          driver_id: 1,
          date: "Bad date",
          rating: 5,
          cost: 16.83,
        },
      }
      # Act
      patch trip_path(id: trip_id), params: trip_hash

      # Assert
      must_respond_with :bad_request
    end
  end

  describe "create" do
    it "can create a new trip" do
      trip_hash = {
        trip: {
          passenger_id: 2,
          driver_id: 2,
          date: Date.today,
          rating: 5,
          cost: 15.75,
        },
      }

      # Act-Assert
      expect {
        post trips_path, params: trip_hash
      }.must_change "Trip.count", 1

      new_trip = Trip.last

      expect(new_trip.passenger_id).must_equal trip_hash[:trip][:passenger_id]
      expect(new_trip.driver_id).must_equal trip_hash[:trip][:driver_id]
      expect(new_trip.date).must_equal trip_hash[:trip][:date]
      expect(new_trip.rating).must_equal trip_hash[:trip][:rating]
      expect(new_trip.cost).must_equal trip_hash[:trip][:cost]

      must_respond_with :redirect
      must_redirect_to trip_path(new_trip.id)
    end
  end

  describe "destroy" do
    it "removes a trip from the database" do
      # Act-Assert
      trip = Trip.create!(passenger_id: 1, driver_id: 1, date: "20190416", rating: 5, cost: 15.75)

      expect {
        delete trip_path(trip)
      }.must_change "Trip.count", -1

      must_respond_with :redirect
      must_redirect_to root_path

      after_trip = Trip.find_by(id: trip.id)
      expect(after_trip).must_be_nil
    end
  end
end
