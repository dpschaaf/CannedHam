class SeoLandingPagesController < ApplicationController
  def show
    @seo_landing_page = SeoLandingPage.where(path: params[:path]).first
    render html: cell(Location::Cell::Show, seo_landing_page,
      layout: CannedHam::Cell::Layout,
      footer_group: footer_group)
  end

  private

  def footer_group
    if @seo_landing_page.city_id
      nil
    elsif @seo_landing_page.county_id
      @seo_landing_page.county.cities
    elsif @seo_landing_page.state_id
      @seo_landing_page.state.counties
    else
      nil
    end
  end
end
