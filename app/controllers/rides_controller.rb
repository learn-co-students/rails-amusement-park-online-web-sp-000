class RidesController < ApplicationController
  before_action :set_ride, only: %i[ show edit update destroy ]

  # GET /rides or /rides.json
  def index
    @rides = Ride.all
  end

  # GET /rides/1 or /rides/1.json
  def show
  end

  # GET /rides/new
  def new
    @ride = Ride.new
  end

  # GET /rides/1/edit
  def edit
  end

  # POST /rides or /rides.json
  def create
    @ride = Ride.new(ride_params)

    respond_to do |format|
      if @ride.save
        format.html { redirect_to @ride, notice: "Ride was successfully created." }
        format.json { render :show, status: :created, location: @ride }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rides/1 or /rides/1.json
  def update
    respond_to do |format|
      if @ride.update(ride_params)
        format.html { redirect_to @ride, notice: "Ride was successfully updated." }
        format.json { render :show, status: :ok, location: @ride }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rides/1 or /rides/1.json
  def destroy
    @ride.destroy
    respond_to do |format|
      format.html { redirect_to rides_url, notice: "Ride was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def take_ride
    @ride = Ride.new(attraction_id: params[:ride_id], user_id: session[:user_id])
    tookRide = @ride.take_ride
    if tookRide[1]
      #binding.pry
      session[:ride] = tookRide
      redirect_to user_path(session[:user_id]), alert: "#{tookRide}"
    else 
     # binding.pry
      session[:ride_id] = Ride.last.id
      redirect_to user_path(session[:user_id]), alert: "Thanks for riding the #{@ride.attraction.name}!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ride
      @ride = Ride.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ride_params
      params.require(:ride).permit(:user_id, :attraction_id)
    end
end
