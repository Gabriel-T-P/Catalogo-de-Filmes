class RemoveReleaseYearFromMovies < ActiveRecord::Migration[7.2]
  def change
    remove_column :movies, :release_year, :string
  end
end
