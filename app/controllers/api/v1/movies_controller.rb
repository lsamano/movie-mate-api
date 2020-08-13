class Api::V1::MoviesController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]
  before_action :api_key

  def index
    discover = Tmdb::Discover.movie.results.map { |obj| obj.to_h }
    upcoming = Tmdb::Movie.upcoming.results.map { |obj| obj.to_h }
    now_playing = Tmdb::Movie.now_playing.results.map { |obj| obj.to_h }
    popular = Tmdb::Movie.popular.results.map { |obj| obj.to_h }
    top_rated = Tmdb::Movie.top_rated.results.map { |obj| obj.to_h }

    data = {
      discover: discover,
      upcoming: upcoming,
      nowPlaying: now_playing,
      popular: popular,
      topRated: top_rated
    }

    render json: data
  end

  def show
    @movie = Tmdb::Movie.detail(params[:id])
    render json: @movie
  end

  private

  def api_key
    # Tmdb::Api.key(Rails.application.credentials.tmdb_key)
    Tmdb::Api.key("9e618d2863d102107605400d64a71060")
  end

end
