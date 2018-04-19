# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  released_at :datetime
#  avatar      :string
#  genre_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Movie < ApplicationRecord
  has_many :genre_movies
  has_many :genres, through: :genre_movies
  has_many :comments
  has_many :rates

  validates_with TitleBracketsValidator
  self.per_page = 10

  def self.search(search)
    if search
      where('title LIKE ?', "#{search}")
    else
      all
    end
  end
end
