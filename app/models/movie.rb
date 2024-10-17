class Movie < ApplicationRecord
  belongs_to :director
  belongs_to :movie_genre

  enum :status, {:draft=>0, :to_be_published=>3, :published=>6}
end
