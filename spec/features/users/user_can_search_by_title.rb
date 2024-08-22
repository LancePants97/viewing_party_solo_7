require 'rails_helper'

RSpec.describe 'Search by Title', type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Scooby', email: 'scoobydoobie@mysteryinc.com')
    @user2 = User.create!(name: 'Shaggy', email: 'therealshaggy@mysteryinc.com')
  end

  it "allows the user to search for a movie by its title" do
    VCR.use_cassette("tmdb_movies") do
      visit "/users/#{@user1.id}/discover"

      expect(page).to have_link("Discover Top Rated Movies")
      expect(page).to have_content("Enter a Movie by Title")
      expect(page).to have_field("search")
      expect(page).to have_button("Search by Title")
      expect(page).to have_button("Search")
    end
  end
end