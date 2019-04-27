class UsersController < ApplicationController

  def home
  end

  def signin
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path(@user)
    end
  end

  def show
    if !logged_in?
      redirect_to '/'
    else
      @user = User.find(params[:id])
      if params[:attraction_id]
        @attraction = Attraction.find(params[:attraction_id])
        if too_short? && not_enough_tickets?
          flash[:message] = "You are not tall enough to ride the #{@attraction.name} You do not have enough tickets to ride the #{@attraction.name}"
          redirect_to user_path(@user)
        elsif too_short?
          flash[:message] = "You are not tall enough to ride the #{@attraction.name}"
          redirect_to user_path(@user)
        elsif not_enough_tickets?
          flash[:message] = "You do not have enough tickets to ride the #{@attraction.name}"
          redirect_to user_path(@user)
        else
          ticket_and_happiness_calculator(@user, @attraction)
          flash[:message] = "Thanks for riding the #{@attraction.name}!"
        end
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

  def ticket_and_happiness_calculator(user, attraction)
    tickets = user.tickets - attraction.tickets
    happiness = user.happiness + attraction.happiness_rating
    nausea = user.nausea + attraction.nausea_rating
    user.update(:tickets => tickets, :happiness => happiness, :nausea => nausea)
  end

  def too_short?
    @user.height < @attraction.min_height
  end

  def not_enough_tickets?
    @user.tickets < @attraction.tickets
  end

end
