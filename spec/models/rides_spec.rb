require "rails_helper"

RSpec.describe Ride, type: :model do

  describe "relationships" do
    it { should belong_to :park }
    it { should have_many :ride_mechanics }
    it { should have_many(:mechanics).through(:ride_mechanics) }
  end

  describe "methods" do
    before :each do
      @park_1 = Park.create(name: "Six Flags", admission_price: 40)
      @ride_1 = @park_1.rides.create(name: "Tower of Doom", thrill_rating: 10)
      @ride_2 = @park_1.rides.create(name: "Mind Eraser", thrill_rating: 9)
      @ride_3 = @park_1.rides.create(name: "Splash Mountain", thrill_rating: 7)
    end

    it "#alpha_order" do
      order = @ride_2, @ride_3, @ride_1
      expect(Ride.alpha_order).to eq(order)
    end

    it "#average_rating" do
      expect(Ride.average_rating).to eq(8.67)
    end
  end
end
