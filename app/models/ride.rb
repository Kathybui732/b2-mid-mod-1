class Ride < ApplicationRecord
  belongs_to :park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.alpha_order
    Ride.order(:name)
  end

  def self.average_rating
    rating = average(:thrill_rating)
    rating.round(2)
  end
end
