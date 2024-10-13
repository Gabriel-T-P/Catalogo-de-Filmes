class MovieGenresController < ApplicationController

  def new
    @movie_genre = MovieGenre.new
  end

  def show
    @movie_genre = MovieGenre.find(params[:id])
    @movies_by_genre = Movie.where("movie_genre_id = ?", params[:id])
  end

  def create
    movie_genre_params = params.require(:movie_genre).permit(:name)
    @movie_genre = MovieGenre.new(movie_genre_params)

    if @movie_genre.save
      redirect_to @movie_genre
    else
      render :new
    end

  end

  def edit
    @movie_genre = MovieGenre.find(params[:id])
  end
  
  def update
    movie_genre_params = params.require(:movie_genre).permit(:name)
    @movie_genre = MovieGenre.find(params[:id])

      if @movie_genre.update(movie_genre_params)
        redirect_to @movie_genre
      else
        render :edit
      end

  end

end
