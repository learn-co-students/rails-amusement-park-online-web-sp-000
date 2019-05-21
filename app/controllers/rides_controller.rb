class RidesController < ApplicationController
  def create
    if current_user.height >= params[:min_height].to_i && current_user.tickets >= params[:tickets].to_i
      current_user.tickets -= params[:tickets].to_i
      current_user.happiness += params[:happiness_rating].to_i
      current_user.nausea += params[:nausea_rating].to_i
      current_user.save
      session[:message] = "Thanks for riding the #{params[:name]}!"
    elsif current_user.height < params[:min_height].to_i && current_user.tickets < params[:tickets].to_i
      session[:message] = "You do not have enough tickets to ride the #{params[:name]} and You are not tall enough to ride the #{params[:name]}"
    elsif current_user.tickets < params[:tickets].to_i
      session[:message] = "You do not have enough tickets to ride the #{params[:name]}"
    elsif current_user.height < params[:min_height].to_i
      session[:message] = "You are not tall enough to ride the #{params[:name]}"
    end
    redirect_to user_path(current_user)
  end
end
