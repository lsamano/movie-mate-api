class Api::V1::MoviesController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]
  before_action :api_key

  def index
    render json: Tmdb::Discover.movie.results
  end

  def create
  end

  private

  def api_key
    Tmdb::Api.key(Rails.application.credentials.tmdb_key)
  end
  
  #   def movie_params
  #     params.require(:movie).permit(:)
  #   end

end
