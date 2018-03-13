class MovieDecorator < Draper::Decorator
  delegate_all

  def self.collection_decorator_class
    PaginateDecorator
  end

  def cover
    "http://lorempixel.com/100/150/" +
    %w(abstract nightlife transport).sample +
    "?a=" + SecureRandom.uuid
  end
end
