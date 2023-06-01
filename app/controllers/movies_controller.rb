class MoviesController < ApplicationController
  def index
    # If there are no URL parameters, display all movies
    @movies = Movie.all
    # If a parameter is present, filter the movies using the said parameter
    if params[:query].present?
      # sql_query = "title ILIKE :query OR synopsis ILIKE :query"
      sql_query = <<~SQL
        movies.title @@ :query
        OR movies.synopsis @@  :query
        OR directors.first_name @@  :query
        OR directors.last_name @@  :query
      SQL
      @movies = @movies.joins(:director).where(sql_query, query: params[:query])
    end
  end
end
