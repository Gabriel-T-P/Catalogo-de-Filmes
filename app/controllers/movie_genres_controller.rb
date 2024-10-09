class MovieGenresController < ApplicationController

  def new
    @movie_genre = MovieGenre.new
  end

  def show
    @movie_genre = MovieGenre.find(params[:id])
  end

  def create
    @movie_genre = MovieGenre.new(name: params[:movie_genre][:name])

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
    @movie_genre = MovieGenre.find(params[:id])

      if @movie_genre.update(name: params[:movie_genre][:name])
        redirect_to @movie_genre
      else
        render :edit
      end

  end

  def destroy
    @movie_genre = MovieGenre.find(params[:id])

    if @movie_genre.destroy
      redirect_to root_path
    else
      redirect_to movie_genres_path(params[:id])
    end

  end
  
  

end
