class MovieDecorator < Draper::Decorator
  delegate_all

  def self.collection_decorator_class
    PaginateDecorator
  end

  def cover
    MovieApiInfo.poster(object.movie.title)
  end
end
