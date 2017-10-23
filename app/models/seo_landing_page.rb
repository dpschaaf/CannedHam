class SeoLandingPage < ApplicationRecord
  belongs_to :state, optional: true
  belongs_to :county, optional: true
  belongs_to :city, optional: true

  validates_uniqueness_of :path

  def self.create_from_state(state)
    # /state-name
    seo_landing_page = SeoLandingPage.new
    seo_landing_page.state = state
    seo_landing_page.path = state.to_seo_param
    seo_landing_page.save
    puts "Created /#{seo_landing_page.path}"
  end

  def self.create_from_county(county)
    # /some-name-county-state-name
    seo_landing_page = SeoLandingPage.new
    seo_landing_page.county = county
    seo_landing_page.state = county.state
    seo_landing_page.path = "#{county.to_seo_param}-#{county.state.to_seo_param}"
    seo_landing_page.save
    puts "Created /#{seo_landing_page.path}"
  end

  def self.create_from_city(city)
    # /city-name-state-name
    seo_landing_page = SeoLandingPage.new
    seo_landing_page.city = city
    seo_landing_page.county = city.county
    seo_landing_page.state = city.county.state
    seo_landing_page.path = "#{city.to_seo_param}-#{city.state.to_seo_param}"
    seo_landing_page.save
    puts "Created /#{seo_landing_page.path}"
  end
end
