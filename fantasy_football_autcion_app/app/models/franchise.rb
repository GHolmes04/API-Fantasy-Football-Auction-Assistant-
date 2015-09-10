class Franchise < ActiveRecord::Base
  belongs_to :user
  belongs_to :league

  has_many :players, through: :roster, inverse_of: :franchises
  has_one :roster, inverse_of: :franchise
end
