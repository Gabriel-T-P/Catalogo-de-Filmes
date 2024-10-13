class CreateMovies < ActiveRecord::Migration[7.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :release_year
      t.string :synopsis
      t.string :origin_country
      t.integer :duration
      t.references :director, null: false, foreign_key: true
      t.references :movie_genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
