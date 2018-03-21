require 'rails_helper'

describe 'Genres requests no match with API', type: :request do
  let!(:genres) { create_list(:genre, 5, :with_movies) }
  describe 'genre list' do
    let(:response) do
      {
        message: "Couldn't find Movie"
      }.to_json
    end

    before do
      stub_request(:get, /pairguru-api.herokuapp.com/).to_return(body: response, headers: { 'Content-Type': 'application/json' })
    end

    it 'displays only related movies' do
      visit '/genres/' + genres.sample.id.to_s + '/movies'
      expect(page).to have_selector('table tbody tr', count: 5)
    end
  end
end

describe 'Genres requests match with API', type: :request do
  describe 'genre list' do
    let!(:genres) { create_list(:genre, 1, :with_movie) }
    let(:response) do
    {
      data: {
        id: '10',
        type: 'movie',
        attributes: {
          title: 'Deadpool',
          plot: 'A fast-talking mercenary with a morbid sense of humor is subjected to a rogue experiment that leaves him with accelerated healing powers and a quest for revenge.',
          rating: 8,
          poster: '/deadpool.jpg'
        }
      }
    }.to_json
    end

    before do
      stub_request(:get, /pairguru-api.herokuapp.com/).to_return(body: response, headers: { 'Content-Type': 'application/json' })
    end

    it 'displays only related movies' do
      visit '/genres/' + genres.sample.id.to_s + '/movies'
      expect(page).to have_selector('table tbody tr', count: 1)
    end
  end
end
