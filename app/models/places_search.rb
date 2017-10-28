class PlacesSearch
  URL = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json'

  def initialize(lat_long, radius  = 80_000)
    @lat_long = lat_long
    @radius = radius
  end

  def search_results_for_term(key_word)
    
  end

  private


end
