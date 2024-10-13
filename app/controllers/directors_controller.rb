class DirectorsController < ApplicationController

  def show
    @director = Director.find(params[:id])
    @favorite_genre = MovieGenre.find(@director.movie_genre_id)
    @movies_by_director = Movie.where("director_id = ?", params[:id])
  end

  def new
    @director = Director.new
  end

  def create
    director_params = params.require(:director).permit(:name, :nationality, :birth_date, :movie_genre_id)
    @director = Director.new(director_params)

    if @director.save
      flash[:notice] = "Diretor criado com sucesso."
      redirect_to @director
    else
      flash.now[:notice] = "Algo deu errado no cadastro."
      render 'new'
    end

  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    director_params = params.require(:director).permit(:name, :nationality, :birth_date, :movie_genre_id)
    @director = Director.find(params[:id])
    
      if @director.update_attributes(director_params)
        flash[:notice] = "Informações do diretor atualizadas."
        redirect_to @director
      else
        flash[:notice] = "Algo deu errado na alteração"
        render 'edit'
      end

  end

end