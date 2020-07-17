require "rails_helper"

RSpec.describe "Mechanics Index Page" do
	before :each do
    @mechanic_1 = Mechanic.create(name: "Kathy", years_of_experience: 2)
    @mechanic_2 = Mechanic.create(name: "Justin", years_of_experience: 8)
	end

  it "displays all mechanics and their attributes" do
    visit "/mechanics"
    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_of_experience)
    expect(page).to have_content(@mechanic_2.name)
    expect(page).to have_content(@mechanic_2.years_of_experience)
  end
end
