class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end

end

#
# it "links from the attractions index page to the attractions' show pages" do
#   click_link('See attractions')
#   click_link("Go on #{@ferriswheel.name}")
#   expect(current_path).to eq("/attractions/2")
# end

# <ActionController::Parameters {"_method"=>"get", "authenticity_token"=>"cCW2UzIaOQBMgK8V3QTbckdXhKKgwuKTJjaUzlbyUbTuGUuZZyJ/DVx/5A0qiOgD9ebgPfHS8N+9SzirZiU7Y
# Q==", "controller"=>"attractions", "action"=>"show", "id"=>"2"} permitted: false>
