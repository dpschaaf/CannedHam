class SeoLandingPage < ApplicationRecord
  belongs_to :state, optional: true
  belongs_to :county, optional: true
  belongs_to :city, optional: true

  def self.create_state_landing_pages
    State.all.each do |state|
      # /state-name
      seo_landing_page = SeoLandingPage.new
      seo_landing_page.state = state
      seo_landing_page.path = state.name.parameterize
      if seo_landing_page.save
        puts "Created /#{seo_landing_page.path}"
      end
    end
  end

  def self.create_county_landing_pages
    County.all.each do |county|
      # /some-name-county-state-name
      seo_landing_page = SeoLandingPage.new
      seo_landing_page.state = county.state
      seo_landing_page.county = county
      seo_landing_page.path = "#{county.name.parameterize}-county-#{county.state.name.parameterize}"
      if seo_landing_page.save
        puts "Created /#{seo_landing_page.path}"
      end
    end
  end

  def self.create_city_landing_pages
    City.all.each do |city|
      # /city-name-state-name
      seo_landing_page = SeoLandingPage.new
      seo_landing_page.state = city.county.state
      seo_landing_page.county = city.county
      seo_landing_page.path = "#{city.name.parameterize}-#{seo_landing_page.state.name.parameterize}"
      if seo_landing_page.save
        puts "Created /#{seo_landing_page.path}"
      end
    end
  end
end
