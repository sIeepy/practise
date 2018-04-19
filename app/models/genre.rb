# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

class Genre < ApplicationRecord
  has_many :genre_movies
  has_many :movies, through: :genre_movies
end
