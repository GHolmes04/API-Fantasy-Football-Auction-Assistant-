class League < ActiveRecord::Base
  has_many :franchises, inverse_of: :league
end
