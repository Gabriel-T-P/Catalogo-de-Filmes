class HomeController < ApplicationController

  def index
    @movie_genres = MovieGenre.all
    @directors = Director.all
  end

end
