class MoviesController < ApplicationController
  def index
    # If there are no URL parameters, display all movies
    @movies = Movie.all
    # If a parameter is present, filter the movies using the said parameter
    if params[:query].present?
      sql_query = "title ILIKE :query OR synopsis ILIKE :query"
      @movies = @movies.where(sql_query, query: "%#{params[:query]}%")
    end
  end
end
