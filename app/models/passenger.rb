class Passenger < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :phone_num, presence: true

  # total amount a passenger spends

  def total_amount
    total = 0
    self.trips.each do |trip|
      total += trip.cost / 100
    end
    return total
  end
end
