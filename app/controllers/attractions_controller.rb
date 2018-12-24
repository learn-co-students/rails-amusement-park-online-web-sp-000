class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    # attractions controller
    binding.pry
  end

end



# With hidden field "attraction_id"
 # "ride"=>{"attraction_id"=>""}, "commit"=>"Go on this ride", "controller"=>"attractions", "action"=>"update", "id"=>"8"}

# Without hidden_field "attraction_id"
# "commit"=>"Go on this ride", "controller"=>"attractions", "action"=>"update", "id"=>"4"}
