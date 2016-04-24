class WelcomeController < ApplicationController
  def index
    @all_gear = Gear.all

    respond_to do |format|
      format.html
      format.json { render json: @all_gear }
    end
  end
end
