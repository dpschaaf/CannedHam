require 'rails_helper'

RSpec.describe PlacesSearch, type: :model do
  places_search_results = YAML.load_file(File.join(Rails.root, 'spec/fixtures/places_search_results.yml'))
  details_search_results = YAML.load_file(File.join(Rails.root, 'spec/fixtures/details_search_results.yml'))

  let(:lat_long) { LatLong.new(latitude: 48.8130569,longitude: -100.0609678) }
  before do
    allow(HTTParty).to receive(:get)
    allow(HTTParty).to receive(:get).with(PlacesSearch::TEXT_SEARCH_URL, any_args) { places_search_results }
    allow(HTTParty).to receive(:get).with(PlacesSearch::DETAILS_SEARCH_URL, any_args) { details_search_results }
  end
  describe '.parsed_results' do
    let(:keyword) { 'scrap metal' }
    subject(:search_results) { PlacesSearch.parsed_results(lat_long, keyword) }
    it 'makes a request to the places API' do
      expect(HTTParty).to receive(:get).with(PlacesSearch::TEXT_SEARCH_URL, any_args).once
      search_results
    end
    it 'makes multiple requests to the text API' do
      expect(HTTParty).to receive(:get)#.with(PlacesSearch::DETAILS_SEARCH_URL, any_args).times(10)
      search_results
    end
    it 'returns at most 10 results' do
      expect(search_results.count).to eq 10
    end
    describe 'result parsing' do
      let(:result) {search_results.first}
      it 'returns a hash with the relevant details' do
        expect(result[:name]). to eq 'Philz Coffee'
        expect(result[:address]). to eq "118 Paseo De San Antonio Walk, San Jose, CA 95112, USA"
        expect(result[:address_html]). to eq "<span class=\"street-address\">118 Paseo De San Antonio Walk</span>, <span class=\"locality\">San Jose</span>, <span class=\"region\">CA</span> <span class=\"postal-code\">95112</span>, <span class=\"country-name\">USA</span>"
        expect(result[:url]). to eq 'http://www.philzcoffee.com/'
        expect(result[:google_maps_url]). to eq "https://maps.google.com/?cid=11856370194626606825"
      end
    end

  end
end
