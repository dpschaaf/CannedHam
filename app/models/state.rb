class State < ApplicationRecord
  has_many :counties
  has_many :cities, through: :counties

  validates_uniqueness_of :name, :abbreviation
end
