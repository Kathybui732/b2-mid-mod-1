require "rails_helper"

RSpec.describe "Park Show Page" do
  before :each do
    @park_1 = Park.create(name: "Six Flags", admission_price: 40)
    @ride_1 = @park_1.rides.create(name: "Tower of Doom", thrill_rating: 10)
    @ride_2 = @park_1.rides.create(name: "Mind Eraser", thrill_rating: 9)
    @ride_3 = @park_1.rides.create(name: "Splash Mountain", thrill_rating: 7)
  end

  it "displays all park's name and price" do
    visit "/parks/#{@park_1.id}"
    expect(page).to have_content(@park_1.name)
    expect(page).to have_content(@park_1.admission_price)
  end

  it "displays all the rides associated with the park in alpha order" do
    visit "/parks/#{@park_1.id}"
    rides = "Mind Eraser Splash Mountain Tower of Doom"
    expect(page).to have_content(rides)
  end

  it "displays average thrill rating" do
    visit "/parks/#{@park_1.id}"
    expect(page).to have_content(8.67)
  end
end
