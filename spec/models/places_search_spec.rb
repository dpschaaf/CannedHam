require 'rails_helper'

RSpec.describe PlacesSearch, type: :model do
  describe 'new' do
    it 'initializes with a LatLong' do 
      lat_long = City.first.lat_long
      places_search = PlacesSearch.new(lat_long)
      expect(places_search).to be_a(PlacesSearch)
    end
  end
  describe '#search_results_for_term' do
    subject(:search_results) {  }
    it 'makes a request to the API' do
    end
    describe 'params' do
      it 'contains key' do
      end
      it 'contains location' do
      end
      it 'contains radius' do
      end
      it 'contains rankyby' do
      end
      it 'contains keyword' do
      end
    end
  end
end
