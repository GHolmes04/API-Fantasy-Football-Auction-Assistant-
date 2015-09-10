class Player < ActiveRecord::Base
  has_many :franchises, through: :rosters, inverse_of: :players
  has_many :rosters, inverse_of: :player
end
