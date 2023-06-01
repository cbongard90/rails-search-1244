class MoviesController < ApplicationController
  def index
    # If there are no URL parameters, display all movies
    @movies = Movie.all
    # If a parameter is present, filter the movies using the said parameter
    if params[:query].present?
      @movies = @movies.where("title ILIKE ?", "%#{params[:query]}%")
    end
  end
end
