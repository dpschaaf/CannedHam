class County < ApplicationRecord
  belongs_to :state
  has_many :seo_landing_pages
end
