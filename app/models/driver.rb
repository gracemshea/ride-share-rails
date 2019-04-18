class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true

  # Average rating for a driver
  def average_rating
    return "N/A" if self.trips = []
    ratings = self.trips.map do |trip|
      trip.rating
    end

    average_rating = "%.1f" % (ratings.reduce(:+) / ratings.length.to_f)
    return average_rating
  end
end
