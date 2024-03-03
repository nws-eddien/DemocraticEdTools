class RoomsRule < ApplicationRecord
  belongs_to :rule
  belongs_to :room
end
