class AddFavoriteGenreToDirector < ActiveRecord::Migration[7.2]
  def change
    add_reference :directors, :movie_genre, null: false, foreign_key: true
  end
end
