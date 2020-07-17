require "rails_helper"

RSpec.describe "Mechanic Show Page" do
  before :each do
    @park_1 = Park.create(name: "Six Flags", admission_price: 40)
    @ride_1 = @park_1.rides.create(name: "Tower of Doom", thrill_rating: 10)
    @ride_2 = @park_1.rides.create(name: "Mind Eraser", thrill_rating: 9)
    @ride_3 = @park_1.rides.create(name: "Splash Mountain", thrill_rating: 7)
    @mechanic_1 = Mechanic.create(name: "Kathy", years_of_experience: 2)
    RideMechanic.create(ride: @ride_1, mechanic: @mechanic_1)
    RideMechanic.create(ride: @ride_2, mechanic: @mechanic_1)
	end

  it "displays their name and years of experience" do
    visit "/mechanics/#{@mechanic_1.id}"
    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_of_experience)
  end

  it "displays all the rides they are working on" do
    visit "/mechanics/#{@mechanic_1.id}"
    expect(page).to have_content(@ride_1.name)
    expect(page).to have_content(@ride_2.name)
  end

  it "displays a form to add a new ride and when submitted, the name of the new ride is displayed" do
    visit "/mechanics/#{@mechanic_1.id}"
    fill_in :ride_id, with: @ride_3.id
    click_on "Submit"
    expect(current_path).to eq("/mechanics/#{@mechanic_1.id}")
    expect(page).to have_content(@ride_3.name)
  end
end
