class County < ApplicationRecord
  belongs_to :state
  has_many :cities
  has_many :seo_landing_pages
  validates_uniqueness_of :name, scope: :state

  def self.parse_name(name)
    name.gsub(Regexp.new(' \(.+\)| County'), '')
  end

  def to_seo_param
    "#{name.parameterize}-county"
  end
end
