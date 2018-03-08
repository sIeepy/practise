class MovieDecorator < Draper::Decorator
  delegate_all

  def cover
    MovieApiInfo.poster(object.movie.title)
  end
end
