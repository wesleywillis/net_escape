class GearController < ApplicationController
  def index
    @all_gear = Gear.all
    @found_gear = Gear.where(found: true)
    @lost_gear = Gear.where(lost: true)
  end
end
