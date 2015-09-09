class Franchise < ActiveRecord::Base
  belongs_to :user
  belongs_to :league
  has_one :roster


end
