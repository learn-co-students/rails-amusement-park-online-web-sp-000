class RidesController < ApplicationController
  def new
    @user= User.find(session[:user_id])
    @attraction= Attraction.find(params[:id])
    @ride=Ride.new
    @ride.user_id = @user.id
    @ride.attraction_id = @attraction.id
        if @user.height < @attraction.min_height && @user.tickets < @attraction.tickets
      flash.alert = "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
      redirect_to user_path(@user)
        elsif
      @user.height < @attraction.min_height
      flash.alert = "Sorry. You are not tall enough to ride the #{@attraction.name}."
      redirect_to user_path(@user)
        elsif 
        @user.tickets < @attraction.tickets
        flash.alert = "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
        redirect_to user_path(@user)
        else
    @ride.take_ride
    @ride.save
    flash.alert = "Thanks for riding the #{@attraction.name}!"
    redirect_to user_path(@user)
  end
end
end