class WelcomeController < ApplicationController
  def index
    @all_gear = Gear.all
  end
end
