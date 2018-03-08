class MovieApiInfo
  include HTTParty

  base_uri 'https://pairguru-api.herokuapp.com/api/v1/movies'

  def initialize; end

  def self.plot(title)
    response = get("/#{title.gsub(' ', '%20')}")
    response['data']['attributes']['plot']
  end

  def self.rating(title)
    response = get("/#{title.gsub(' ', '%20')}")
    response['data']['attributes']['rating']
  end

  def self.poster(title)
    response = get("/#{title.gsub(' ', '%20')}")
    poster = response['data']['attributes']['poster']
    "https://pairguru-api.herokuapp.com#{poster}"
  end
end
