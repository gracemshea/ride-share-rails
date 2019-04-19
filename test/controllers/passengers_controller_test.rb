require "test_helper"

describe PassengersController do
  before do
    @passenger = Passenger.create!(name: "Test Passenger", phone_num: "000-000-0000")
  end
  # describe "index" do
  #   it "can get index" do
  #     # Your code here

  #     # Arrange
  #     Passenger.create!(
  #       name: "Test Name",
  #       phone_num: "000-000-0000",
  #     )

  #     # Act
  #     get passengers_path

  #     # Assert
  #     must_respond_with :ok
  #   end

  #   it "renders even if there are zero passengers" do
  #     # Arrange
  #     Passenger.destroy_all

  #     # Act
  #     get passengers_path

  #     # Assert
  #     must_respond_with :ok
  #   end
  # end

  # describe "show" do
  #   it "returns a 404 status code if the passenger doesn't exist" do

  #     # Arrange
  #     passenger_id = 12345

  #     # Act
  #     get passenger_path(passenger_id)

  #     # Assert
  #     must_respond_with :not_found
  #   end

  #   it "works for a passenger that DOES exit" do
  #     get passenger_path(@passenger.id)

  #     must_respond_with :ok
  #   end
  # end

  # describe "edit" do
  #   it "respond with OK for a real passenger" do
  #     get edit_passenger_path(@passenger)
  #     must_respond_with :ok
  #   end

  #   it "responds with NOT FOUND for a fake passenger" do
  #     passenger_id = Passenger.last.id + 1
  #     get edit_passenger_path(passenger_id)
  #     must_respond_with :not_found
  #   end
  # end

<<<<<<< HEAD
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
      expect(@passenger.name).must_equal(passenger_data[:passenger][:name])
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
      passenger_data[:passenger][:name] = ""

      # Assumptions
      @passenger.assign_attributes(passenger_data[:passenger])
      expect(@passenger).wont_be :valid?
      @passenger.reload

      # Act
      patch passenger_path(@passenger), params: passenger_data

      # Assert
      must_respond_with :not_found
    end
  end

  # describe "new" do
  #   it "returns status code 200" do
  #     get new_passenger_path
  #     must_respond_with :ok
  #   end
  # end

  # describe "create" do
  #   it "creates a new passenger" do
  #     # Arrange
  #     passenger_data = {
  #       passenger: {
  #         name: "Test Passenger",
  #         phone_num: "123-456-7890",
  #       },
  #     }

  #     # Act
  #     expect {
  #       post passengers_path, params: passenger_data
  #     }.must_change "Passenger.count", +1

  #     # Assert
  #     must_respond_with :redirect
  #     must_redirect_to passengers_path

  #     passenger = Passenger.last
  #     expect(passenger.name).must_equal passenger_data[:passenger][:name]
  #     expect(passenger.vin).must_equal passenger_data[:passenger][:phone_num]
  #   end

  #   it "sends back bad_request if no passenger data is sent" do
  #     # Arrange
  #     passenger_data = {
  #       passenger: {
  #         name: "",
  #       },
  #     }

  #     # Act
  #     expect {
  #       post passengers_path, params: passenger_data
  #     }.wont_change "Passenger.count"

  #     # Assert
  #     must_respond_with :bad_request
  #   end
  # end

  # describe "destroy" do
  #   it "removes the driver from the database" do
  #     # Act
  #     expect {
  #       delete passenger_path(@passenger)
  #     }.must_change "Passenger.count", -1

  #     # Assert
  #     must_respond_with :redirect
  #     must_redirect_to passengers_path

  #     destroyed_passenger = Passenger.find_by(id: @passenger.id)
  #     expect(destroyed_passenger).must_be_nil
  #   end
  # end
=======
  # # GRACE ===================================
  # describe "update" do
  #   let (:passenger_data) {
  #     {
  #       passenger: {
  #         name: "changed name",
  #       },
  #     }
  #   }
  #   it "changes the data on the model" do
  #     # Assumptions
  #     @passenger.assign_attributes(passenger_data[:passenger])
  #     expect(@passenger).must_be :valid?
  #     @passenger.reload

  #     # Act
  #     patch passenger_path(@passenger), params: passenger_data

  #     # Assert
  #     must_respond_with :redirect
  #     must_redirect_to passenger_path(@passenger)

  #     @passenger.reload
  #     expect(@passenger.name).must_equal(passenger_data[:driver][:name])
  #   end

  #   it "responds with NOT FOUND for a fake passenger" do
  #     # Arrange
  #     passenger_data[:passenger][:name] = ""

  #     # Assumptions
  #     @passenger.assign_attributes(passenger_data[:passenger])
  #     expect(@passenger).wont_be :valid?
  #     @passenger.reload

  #     # Act
  #     patch passenger_path(@passenger), params: passenger_data

  #     # Assert
  #     must_respond_with :bad_request
  #   end

  #   it "responds with BAD REQUEST for bad data" do
  #     # Arrange
  #     driver_data[:passenger][:name] = ""

  #     # Assumptions
  #     @passenger.assign_attributes(passenger_data[:passenger])
  #     expect(@passenger).wont_be :valid?
  #     @passenger.reload

  #     # Act
  #     patch passenger_path(@passenger), params: passenger_data

  #     # Assert
  #     must_respond_with :bad_request
  #   end
  # end
  # # GRACE END ===================================

  # describe "new" do
  #   it "returns status code 200" do
  #     get new_passenger_path
  #     must_respond_with :ok
  #   end
  # end

  # describe "create" do
  #   it "creates a new passenger" do
  #     # Arrange
  #     passenger_data = {
  #       passenger: {
  #         name: "Test Passenger",
  #         phone_num: "123-456-7890",
  #       },
  #     }

  #     # Act
  #     expect {
  #       post passengers_path, params: passenger_data
  #     }.must_change "Passenger.count", +1

  #     # Assert
  #     must_respond_with :redirect
  #     must_redirect_to passengers_path

  #     passenger = Passenger.last
  #     expect(passenger.name).must_equal passenger_data[:passenger][:name]
  #     expect(passenger.vin).must_equal passenger_data[:passenger][:phone_num]
  #   end

  #   it "sends back bad_request if no passenger data is sent" do
  #     # Arrange
  #     passenger_data = {
  #       passenger: {
  #         name: "",
  #       },
  #     }

  #     # Act
  #     expect {
  #       post passengers_path, params: passenger_data
  #     }.wont_change "Passenger.count"

  #     # Assert
  #     must_respond_with :bad_request
  #   end
  # end

  describe "destroy" do
    it "removes the driver from the database" do
      # Act
      expect {
        delete passenger_path(@passenger)
      }.must_change "Passenger.count", -1

      # Assert
      must_respond_with :redirect
      must_redirect_to passengers_path

      destroyed_passenger = Passenger.find_by(id: @passenger.id)
      expect(destroyed_passenger).must_be_nil
    end

    it "returns a 404 if the driver doesn't exit" do
      # Arrange
      passenger_id = 90001

      # Assumptions
      expect(Passenger.find_by(id: passenger_id)).must_be_nil

      # Act
      expect {
        delete passenger_path(passenger_id)
      }.wont_change "Passenger.count"

      # Assert
      must_respond_with :not_found
    end
  end
>>>>>>> dc372f20e890704503d91d66e6fbfe89f4f6a929
end
