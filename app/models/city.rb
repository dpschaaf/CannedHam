class City < ApplicationRecord
  belongs_to :county
  belongs_to :state
  has_many :seo_landing_pages
  has_one :lat_long

  def to_seo_param
    name.parameterize
  end
end
