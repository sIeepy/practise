class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates_presence_of :rating, :movie_id, :user_id
  validates_uniqueness_of :user_id, scope: :movie_id
end
