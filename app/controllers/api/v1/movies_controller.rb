class Api::V1::MoviesController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]
  before_action :api_key

  def index
    discover = Tmdb::Discover.movie.results
    upcoming = Tmdb::Movie.upcoming.results
    now_playing = Tmdb::Movie.now_playing.results
    popular = Tmdb::Movie.popular.results
    top_rated = Tmdb::Movie.top_rated.results

    render json: {
      discover: discover,
      upcoming: upcoming,
      nowPlaying: now_playing,
      popular: popular,
      topRated: top_rated
    }
  end

  def show
    @movie = Tmdb::Movie.detail(params[:id])
    render json: @movie
  end

  private

  def api_key
    Tmdb::Api.key(Rails.application.credentials.tmdb_key)
  end

end
