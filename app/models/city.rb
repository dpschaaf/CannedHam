class City < ApplicationRecord
  belongs_to :county
  belongs_to :state
end
