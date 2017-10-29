class SeoLandingPagesController < ApplicationController
  def show
    puts params
    seo_landing_page = SeoLandingPage.where(path: params[:path]).first
    render html: cell(Location::Cell::Show, seo_landing_page,
      layout: CannedHam::Cell::Layout)
  end
end
