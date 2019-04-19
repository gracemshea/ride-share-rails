class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true

  def total_earnings
    return "N/A" if self.trips == []

    total = 0
    self.trips.each do |trip|
      total += trip.cost / 100
    end

    total -= 1.65
    total *= 0.8
    return total
  end

  def average_rating
    return "N/A" if self.trips == []

    ratings = []
    self.trips.each do |trip|
      ratings << trip.rating unless trip.rating == nil
    end

    average_rating = 0
    ratings.each do |rating|
      average_rating += rating
    end

    average_rating /= ratings.length.to_f
    return "%.1f" % average_rating
  end

  def self.select_driver
    return Driver.all.sample
  end

  # Average rating for a driver
  # def average_rating
  #   return "N/A" if self.trips = []

  # ratings = []

  # self.trips.each do |trip|
  #   ratings << trip.rating
  # end

  # ratings = self.trips.map do |trip|
  #   trip.rating
  # end

  # average_rating = "%.1f" % (ratings.reduce(:+) / ratings.length.to_f)
  # return average_rating
  # end

  # Total earnings for a driver
  # def total_earnings
  #   return "N/A" if self.trips = []

  #   sum = self.trips.reduce(0) { |sum, trip| sum += trip.cost }

  #   sum -= 165
  #   sum *= 0.8
  #   return sum
  # end
end
