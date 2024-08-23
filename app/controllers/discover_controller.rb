class DiscoverController < ApplicationController
  def index
    keyword = params[:search_keywords]
    @user = User.find(params[:id])

    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params[:api_key] = Rails.application.credentials.tmdb[:key]
    end

    response = conn.get("/3/search/movie?#{keyword}?&language=en-US&page=1")

    json = JSON.parse(response.body, symbolize_names: true)
    @movies = json[:results]
  end
end