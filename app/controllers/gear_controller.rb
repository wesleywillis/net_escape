class GearController < ApplicationController
  def index
    @all_gear = Gear.all
    @found_gear = Gear.where(found: true)
    @lost_gear = Gear.where(lost: true)
  end

  def new
    @gear = Gear.new
  end

  def create
    @gear = Gear.new(gear_params
    if @gear.save
      redirect_to root_path
    else
      render "new"
    end    
  end

  private

  def gear_params
    params.require(:gear).permit(:gear_type, :quantity, :color, :wildlife, :wildlife_type, :wildlife_quantity, :latitude, :longitude, :lost, :found)
  end
end
