class MoviesController < ApplicationController

  def index
    if params[:status] == 'to_be_published'
      @movies = Movie.to_be_published
      @params = 'A Ser Lançado'
    elsif params[:status] == 'published'
      @movies = Movie.published
      @params = 'Lançado'
    else
      @movies = Movie.draft
      @params = 'Rascunho'
    end
  end
  

  def new
    @movie = Movie.new
    @directors = Director.all
    @movie_genres = MovieGenre.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
    @directors = Director.all
    @movie_genres = MovieGenre.all
  end
  
  def update
    movie_params = params.require(:movie).permit( :title, :synopsis, :release_year, :poster, :origin_country, :duration, :director_id, :movie_genre_id, :status)
    @movie = Movie.find(params[:id])

      if @movie.update(movie_params)
        flash[:notice] = "Filme editado com sucesso"
        redirect_to @movie
      else
        @directors = Director.all
        @movie_genres = MovieGenre.all
        flash[:notice] = "Algo deu errado na edição"
        render 'edit'
      end
  end
  
  def create
    movie_params = params.require(:movie).permit( :title, :synopsis, :release_year, :poster, :origin_country, :duration, :director_id, :movie_genre_id, :status)
    @movie = Movie.new(movie_params)

    if @movie.save
      flash[:notice] = "Filme cadastrado com sucesso"
      redirect_to @movie
    else
      @directors = Director.all
      @movie_genres = MovieGenre.all
      flash[:notice] = "Algo deu errado no cadastro"
      render 'new'
    end

  end
  

end
