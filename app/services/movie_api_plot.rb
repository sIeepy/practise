class MovieApiPlot
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
end
