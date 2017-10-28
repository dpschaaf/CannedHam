class PlacesController < ApplicationController
  def show
    @lat_long = LatLong.find(params[:id])
    keyword = params[:keyword] || 'scrap metal'
    parsed_results = PlacesSearch.parsed_results(@lat_long, keyword)
    render html: cell(Place::Cell::Show, @lat_long, parsed_results: parsed_results, layout: false)
  end
end
