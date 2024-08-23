class TopRatedMoviesController < ApplicationController
  def index
    @user = User.find(params[:id])

    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params[:api_key] = Rails.application.credentials.tmdb[:key]
    end

    response = conn.get("/3/movie/top_rated?language=en-US&page=1") do |req|
      req.params[:api_key] = Rails.application.credentials.tmdb[:key]
    end

    json = JSON.parse(response.body, symbolize_names: true)
    @top_movies = json[:results]
  end
end