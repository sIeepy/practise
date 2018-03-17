class MovieApiInfo
  include HTTParty

  base_uri 'https://pairguru-api.herokuapp.com/api/v1/movies'

  def initialize; end

  def self.plot(title, plot)
    response = get("/#{title.gsub(' ', '%20')}")
    if response['message'] == "Couldn't find Movie"
      plot
    else
      response['data']['attributes']['plot']
    end
  end

  def self.rating(title)
    response = get("/#{title.gsub(' ', '%20')}")
    response['data']['attributes']['rating']
  end

  def self.poster(title, cover)
    response = get("/#{title.gsub(' ', '%20')}")
    binding.pry
    if response['message'] == "Couldn't find Movie"
      cover
    else
      poster = response['data']['attributes']['poster']
      "https://pairguru-api.herokuapp.com#{poster}"
    end
  end
end
