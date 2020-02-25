class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    @attraction.save ? (redirect_to @attraction) : (redirect_to controller: 'attraction', action: 'new')


  end

  def show
    @user = User.find_by(id: session[:user_id])
    @attraction = Attraction.find_by(id: params[:id])
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
    @user = User.find_by(id: session[:user_id])
    render "You are not authorized" unless @user.admin?
  end

  def update
    #raise params.inspect

    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(name: params[:attraction][:name], happiness_rating: params[:attraction][:happiness_rating], nausea_rating: params[:attraction][:nausea_rating], min_height: params[:attraction][:min_height], tickets: params[:attraction][:tickets])
    redirect_to attraction_path(@attraction)
  end


  private
  def attraction_params
    params.require(:attraction).permit(:name, :happiness_rating, :nausea_rating, :min_height, :tickets)
  end
end
