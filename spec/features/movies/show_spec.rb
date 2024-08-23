require 'rails_helper'

RSpec.describe 'Movie Details Page', type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Scooby', email: 'scoobydoobie@mysteryinc.com')
    @user2 = User.create!(name: 'Shaggy', email: 'therealshaggy@mysteryinc.com')
  end

  it "allows the user to search for movies by their title" do
    VCR.use_cassette("search_movies") do 
      visit "/users/#{@user1.id}/discover"

      fill_in :search_keywords, with: "Shawshank Redemption"
      click_button 'Search'
      # save_and_open_page
      click_link "The Shawshank Redemption"

      # save_and_open_page
    end
  end
end