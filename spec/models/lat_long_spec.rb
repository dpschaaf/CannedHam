require 'rails_helper'

RSpec.describe PlacesSearch, type: :model do
  describe '#to_formatted_s' do
    it 'returns a comma separated pair' do 
      lat_long = LatLong.new(latitude: 48.8130569,longitude: -100.0609678)
      expect(lat_long.to_formatted_s).to eq('48.8130569,-100.0609678')
    end 
  end
end
