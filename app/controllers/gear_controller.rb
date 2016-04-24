class GearController < ApplicationController
  def index
    @all_gear = Gear.all
    @found_gear = Gear.where(found: true)
    @lost_gear = Gear.where(lost: true)

    respond_to do |format|
      format.html
      format.json { render json: @all_gear }
    end
  end

  def new
    @status = params[:status]
    if @status == '1'
      @header = "Thank you for reporting a found item"
    else
      @header = "Thank you for reporting a lost item"
    end
    puts "$$" * 20
    puts @status
    puts "$$" * 20

    @gear = Gear.new
  end

  def create
    @gear = Gear.new(gear_params)
    if @gear.save
      redirect_to root_path
    else
      render "new"
    end

    # respond_to do |format|
    #   format.html
    #   format.json { render json: @gear }
    # end

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
    params.require(:gear).permit(:gear_type, :gear_quantity, :color, :wildlife, :wildlife_type, :wildlife_quantity, :latitude, :longitude, :lost, :found)
  end
end
