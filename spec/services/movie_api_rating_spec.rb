require 'rails_helper'

describe 'MovieApiRating' do
  let(:movie) { create(:movie) }
  let(:movie_api) { create(:movie_api) }
  let(:bad_response) { File.read('spec/fixtures/api_error_message.json') }
  let(:good_response) { File.read('spec/fixtures/api_good_message.json') }

  describe '#rating' do
    describe 'invalid params' do
      before { request_helper(bad_response) }

      it 'returns message' do
        expect(MovieApiRating.rating(movie.title)).to eq 'Not rated yet'
      end
    end

    describe 'valid params' do
      before { request_helper(good_response) }

      it 'returns message' do
        expect(MovieApiRating.rating(movie_api.title)).to eq 8.0
      end
    end
  end
end
