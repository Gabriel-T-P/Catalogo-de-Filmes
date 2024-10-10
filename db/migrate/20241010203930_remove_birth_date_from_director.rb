class RemoveBirthDateFromDirector < ActiveRecord::Migration[7.2]
  def change
    remove_column :directors, :favorite_genre_id, :references
  end
end
