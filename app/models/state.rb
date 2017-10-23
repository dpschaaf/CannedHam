class State < ApplicationRecord
  has_many :counties
  has_many :cities, through: :counties
  has_many :seo_landing_pages

  validates_uniqueness_of :name, :abbreviation

  def to_seo_param
    name.parameterize
  end
end
