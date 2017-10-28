class PlacesSearch
  TEXT_SEARCH_URL = 'https://maps.googleapis.com/maps/api/place/textsearch/json'

  DETAILS_SEARCH_URL = 'https://maps.googleapis.com/maps/api/place/details/json'

  def self.parsed_results(lat_long, keyword)
    results = search_results_for_term(lat_long, keyword)['results']
    detailed_results = results.first(10).map do |result|
      id =  result['place_id']
      details_search(id)['result']
    end
    detailed_results.map do |result|
      {
        name: result['name'],
        address: result['formatted_address'],
        address_html: result['adr_address'],
        url: result['website'],
        google_maps_url: result['url']
      }
    end
  end

  def self.search_results_for_term(lat_long, keyword)
    HTTParty.get(TEXT_SEARCH_URL, text_search_options(lat_long, keyword))
  end

  def self.details_search(id)
    HTTParty.get(DETAILS_SEARCH_URL,
      { query:
        {
          key: ENV['GOOGLE_PLACES_API_KEY'],
          placeid: id
        }
      }
    )
  end

  private

  class << self
    def text_search_options(lat_long, keyword)
      {
        query: {
          key: ENV['GOOGLE_PLACES_API_KEY'],
          query: keyword,
          location: lat_long.to_formatted_s,
          radius: 50_000,
          language: I18n.locale
        }
      }
    end
  end

end
