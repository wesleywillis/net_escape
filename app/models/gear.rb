class Gear < ActiveRecord::Base
  validates_inclusion_of :longitude, :in => -99...99
  validates_inclusion_of :latitude, :in => -99...99
end
