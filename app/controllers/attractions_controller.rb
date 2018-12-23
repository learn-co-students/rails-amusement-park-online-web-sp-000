class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
  
  end

end
#
# it 'has a link from the user show page to the attractions index page' do
#   expect(page).to have_content("See attractions")
#   click_link('See attractions')
# end
#
# it 'links from the user show page to the attractions index page' do
#   click_link('See attractions')
#   expect(current_path).to eq('/attractions')
# end
#
# it 'prevents users from editing/deleting/adding rides on the index page' do
#   click_link('See attractions')
#   expect(current_path).to eq('/attractions')
#   expect(page).to_not have_content("edit")
#   expect(page).to_not have_content("delete")
#   expect(page).to_not have_content("new attraction")
# end
#
# it 'has titles of the rides on the attractions index page' do
#   click_link('See attractions')
#   expect(page).to have_content("#{@ferriswheel.name}")
#   expect(page).to have_content("#{@rollercoaster.name}")
# end
#
# it "has links on the attractions index page to the attractions' show pages" do
#   click_link('See attractions')
#   expect(page).to have_content("Go on #{@ferriswheel.name}")
#   expect(page).to have_content("Go on #{@rollercoaster.name}")
# end
#
# it "links from the attractions index page to the attractions' show pages" do
#   click_link('See attractions')
#   click_link("Go on #{@ferriswheel.name}")
#   expect(current_path).to eq("/attractions/2")
# end
