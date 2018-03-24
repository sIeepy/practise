class MovieApiRating
  include HTTParty

  base_uri 'https://pairguru-api.herokuapp.com/api/v1/movies'

  def initialize; end

  def self.rating(title)
    response = get("/#{title.gsub(' ', '%20')}")
    if response['message'] == "Couldn't find Movie"
      'Not rated yet'
    else
      response['data']['attributes']['rating']
    end
  end
end
