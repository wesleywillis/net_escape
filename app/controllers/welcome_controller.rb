class WelcomeController < ApplicationController
  def index
    @all_gear = Gear.all
    puts "$*$*" * 20
    @found_gear = Gear.where(lost: "0")
    puts @found_gear
    @lost_gear = Gear.where(lost: "1")
    puts @lost_gear
    puts "$*$*" * 20
  end
end
