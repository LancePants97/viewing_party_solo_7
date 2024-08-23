require 'rails_helper'

RSpec.describe 'Search by Title', type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Scooby', email: 'scoobydoobie@mysteryinc.com')
    @user2 = User.create!(name: 'Shaggy', email: 'therealshaggy@mysteryinc.com')
  end

  it "allows the user to search for movies by their title" do
    VCR.use_cassette("search_movies") do 
      visit "/users/#{@user1.id}/discover"

      fill_in :search_keywords, with: "Shawshank Redemption"
      click_button 'Search'

      expect(current_path).to eq "/users/#{@user1.id}/movies"
      expect(page.status_code).to eq 200
      
      within(first(".movie")) do
        expect(page).to have_content("The Shawshank Redemption")
        expect(page).to have_css(".vote_average")
      end
    end
  end

  it "has a link to return to the user's discover page" do
    VCR.use_cassette("search_movies") do 
      visit "/users/#{@user1.id}/discover"
  
      fill_in :search_keywords, with: "Shawshank Redemption"
      click_button 'Search'

      click_link "Discover"
      expect(current_path).to eq "/users/#{@user1.id}/discover"
    end
  end
end