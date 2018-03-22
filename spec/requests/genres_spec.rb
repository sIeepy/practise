require 'rails_helper'

describe 'Genres requests no match with API', type: :request do
  let!(:genres) { create_list(:genre, 5, :with_movies) }
  describe 'genre list' do
    let(:response) { File.read('spec/fixtures/api_error_message.json') }

    before do
      stub_request(:get, /pairguru-api.herokuapp.com/).to_return(body: response, headers: { 'Content-Type': 'application/json' })
    end

    it 'displays only related movies' do
      visit '/genres/' + genres.sample.id.to_s + '/movies'
      expect(page).to have_selector('table tr', count: 5)
    end
  end
end

describe 'Genres requests match with API', type: :request do
  describe 'genre list' do
    let!(:genres) { create_list(:genre, 1, :with_movie) }
    let(:response) { File.read('spec/fixtures/api_good_message.json') }

    before do
      stub_request(:get, /pairguru-api.herokuapp.com/).to_return(body: response, headers: { 'Content-Type': 'application/json' })
    end

    it 'displays only related movies' do
      visit '/genres/' + genres.sample.id.to_s + '/movies'
      expect(page).to have_selector('table tbody tr', count: 1)
    end
  end
end
