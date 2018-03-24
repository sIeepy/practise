require 'rails_helper'

describe 'MovieApiPlot' do
  let(:movie) { create(:movie) }
  let(:movie_api) { create(:movie_api) }
  let(:bad_response) { File.read('spec/fixtures/api_error_message.json') }
  let(:good_response) { File.read('spec/fixtures/api_good_message.json') }
  let(:cover) {
              'http://lorempixel.com/100/150/' +
                %w[abstract nightlife transport].sample +
                '?a=' + SecureRandom.uuid
              }

  describe '#cover' do
    describe 'invalid params' do
      before { request_helper(bad_response) }

      it 'returns message' do
        expect(MovieApiCover.poster(movie.title, cover)).to eq cover
      end
    end

    describe 'valid params' do
      before { request_helper(good_response) }

      it 'returns message' do
        expect(MovieApiCover.poster(movie_api.title, cover)).to eq 'https://pairguru-api.herokuapp.com/deadpool.jpg'
      end
    end
  end
end
