class Roster < ActiveRecord::Base
  belongs_to :franchise, inverse_of: :roster
  belongs_to :player, inverse_of: :rosters
end
