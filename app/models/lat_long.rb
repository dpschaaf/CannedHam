class LatLong < ApplicationRecord
  belongs_to :city

  def to_formatted_s
    "#{latitude},#{longitude}"
  end
end
