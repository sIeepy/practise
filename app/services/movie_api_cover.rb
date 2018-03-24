class MovieApiCover
  include HTTParty

  base_uri 'https://pairguru-api.herokuapp.com/api/v1/movies'

  def initialize; end

  def self.poster(title, cover)
    response = get("/#{title.gsub(' ', '%20')}")
    if response['message'] == "Couldn't find Movie"
      cover
    else
      poster = response['data']['attributes']['poster']
      "https://pairguru-api.herokuapp.com#{poster}"
    end
  end
end
