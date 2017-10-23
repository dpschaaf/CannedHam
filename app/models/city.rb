class City < ApplicationRecord
  belongs_to :county
  belongs_to :state

  has_many :seo_landing_pages
end
