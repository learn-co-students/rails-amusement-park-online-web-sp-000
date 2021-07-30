from attractions index
# <%= link_to 'Add attraction', attraction_add_path(attraction) %>

from attractions contoller
  # @attraction = Attraction.find_by(id: params[:id])
    # @user = User.find(session[:user_id])
    #   if @user.height > @attraction.min_height && @user.tickets > @attraction.tickets 
    #   flash[:message] = "Thanks for riding the #{@attraction.name}"
    #   elsif
    #     @attraction.min_height > @user.height
    #   flash[:message] = "You are not tall enough to ride the #{@attraction.name}"
    #   elsif 
    #     @attraction.tickets > @user.tickets
    #     flash[:message] = "You do not have enough tickets to ride the #{@attraction.name}"
    #   else
    #     @attraction.min_height > @user.height && @attraction.tickets > @user.tickets 
    #     flash[:message] = "You are not tall enough to ride the #{@attraction.name}"
    #     flash[:message] = "You do not have enough tickets to ride the #{@attraction.name}"
    #     end 