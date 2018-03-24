require 'rails_helper'

describe 'MovieApiPlot' do
  let(:movie) { create(:movie) }
  let(:movie_api) { create(:movie_api) }
  let(:bad_response) { File.read('spec/fixtures/api_error_message.json') }
  let(:good_response) { File.read('spec/fixtures/api_good_message.json') }

  describe '#plot' do
    describe 'invalid params' do
      before { request_helper(bad_response) }

      it 'returns message' do
        expect(MovieApiPlot.plot(movie.title, movie.description)).to eq movie.description
      end
    end

    describe 'valid params' do
      before { request_helper(good_response) }

      it 'returns message' do
        expect(MovieApiPlot.plot(movie_api.title, movie_api.description)).to eq 'Fast-talking mercenary'
      end
    end
  end
end
