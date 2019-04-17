require "../test_helper"

describe DriversController do
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

      # Act-Assert
      # TODO -- why can I get it to acknowledge a 404 response??
      # assert_raises ActiveRecord::RecordNotFound do
      #   get driver_path(driver_id)
      # end

      # Act
      get driver_path(driver_id)

      # Assert
      must_respond_with :not_found

      # should_respond_with_status :missing
    end
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
