require 'rails_helper'

RSpec.describe 'Search by Title', type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Scooby', email: 'scoobydoobie@mysteryinc.com')
    @user2 = User.create!(name: 'Shaggy', email: 'therealshaggy@mysteryinc.com')
  end

  it "allows the user to search for top rated movies" do
    VCR.use_cassette("tmdb_movies") do 
      visit "/users/#{@user1.id}/discover"
    end
  
    VCR.use_cassette("top_rated_movies") do  
      click_link("Discover Top Rated Movies")
      expect(page.status_code).to eq 200
      
      within(first(".movie")) do
        expect(page).to have_css(".title")
        expect(page).to have_css(".vote_average")
      end
    end
  end
end