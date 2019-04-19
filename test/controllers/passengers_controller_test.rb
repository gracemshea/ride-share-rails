require "test_helper"

describe PassengersController do
  before do
    @passenger = Passenger.create!(name: "Test Driver", phone_num: "000-000-0000")
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

  describe "show" do
    # Your tests go here
  end

  describe "edit" do
    # Your tests go here
  end

  describe "update" do
    # Your tests go here
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
