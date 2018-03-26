class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates_presence_of :text, :movie_id, :user_id
  validates_uniqueness_of :user_id, scope: :movie_id
end
