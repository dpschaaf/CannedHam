class SeoLandingPage < ApplicationRecord
  belongs_to :state
  belongs_to :county
  belongs_to :city


  def self.create_state_landing_pages
    State.each do |state|
      # /state-name
      seo_landing_page = SeoLandingPage.new
      seo_landing_page.state = state
      seo_landing_page.path = state.name.parameterize
      seo_landing_page.save
    end
  end

  def self.create_county_landing_pages
    County.each do |county|
      # /some-name-county-state-name
      seo_landing_page = SeoLandingPage.new
      seo_landing_page.state = county.state
      seo_landing_page.county = county
      seo_landing_page.path = "#{county.name.parameterize}-county-#{state.name.parameterize}"
    end
  end

  def self.create_city_landing_pages
    City.each do |city|
      # /city-name-state-name
      seo_landing_page = SeoLandingPage.new
      seo_landing_page.state = city.county.state
      seo_landing_page.county = city.county
      seo_landing_page.path = "#{city.name.parameterize}-#{state.name.parameterize}"
    end
  end
end
