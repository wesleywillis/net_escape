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

  def map
    lost_gear = Gear.where(lost: true)
    render json: lost_gear
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

    respond_to do |format|
      format.html
      format.json { render json: @gear }
    end
  end

  def create
    @gear = Gear.new(gear_params)
    if @gear.save
      respond_to do |format|
        format.html {redirect_to root_path}
        format.json { render json: @gear }
      end
    else
      respond_to do |format|
        format.html {render "new"}
        format.json { render json: @gear }
      end
    end

    #respond_to do |format|
    #  format.html {render "new"}
    #  format.json { render json: @gear }
    #end

  end

  private
  def gear_params
    params.require(:gear).permit(:gear_type, :gear_quantity, :color, :wildlife, :wildlife_type, :wildlife_quantity, :latitude, :longitude, :lost, :found)
  end
end
