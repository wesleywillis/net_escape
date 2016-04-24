class GearController < ApplicationController
  def index
    @all_gear = Gear.all
    puts "$*$*" * 20
    @found_gear = Gear.where(lost: "0")
    puts @found_gear
    @lost_gear = Gear.where(lost: "1")
    puts @lost_gear
    puts "$*$*" * 20
  end

  def new
    @status = params[:status]
    if @status === "0"
      @found = "1"
      @header = "Thank you for reporting a FOUND item"
    else
      @found = "0"
      @header = "Thank you for reporting a LOST item"
    end
    puts "$#$#" * 20
    puts @status.class
    puts "$#$#" * 20
    @gear = Gear.new
  end

  def create
    puts "$$" * 20
    puts params[:lost]
    puts "$$" * 20
    @gear = Gear.new(gear_params)
    if @gear.save
      redirect_to root_path
    else
      render "new"
    end
  end


  def found
    gear = Gear.find(params[:id])
    gear.found = "1"
    gear.lost = "0"
    gear.save
    redirect_to '/'
  end



  private
  def gear_params
    puts "%%%%" * 30
    puts params[:gear][:lost]
    puts params[:gear][:lost].class
    params.require(:gear).permit(:gear_type, :gear_quantity, :color, :wildlife, :wildlife_type, :wildlife_quantity, :latitude, :longitude, :lost, :found)
  end
end
