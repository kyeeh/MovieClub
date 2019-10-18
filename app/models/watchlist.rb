class Watchlist < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  #validates :movie, uniqueness: { scope: :user }
  validates_uniqueness_of :movie_id, scope: :user_id
end