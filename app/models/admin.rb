class Admin < ActiveRecord::Base

end

#   it 'allows admins to add an attraction' do
#     click_link('See attractions')
#     click_link("New Attraction")
#     expect(current_path).to eq('/attractions/new')
#     fill_in("attraction[name]", :with => "Haunted Mansion")
#     fill_in("attraction[min_height]", :with => "32")
#     fill_in("attraction[happiness_rating]", :with => "2")
#     fill_in("attraction[nausea_rating]", :with => "1")
#     fill_in("attraction[tickets]", :with => "4")
#     click_button('Create Attraction')
#     expect(current_path).to eq("/attractions/4")
#     expect(page).to have_content("Haunted Mansion")
#   end
#
#   it "has link to attraction/show from attraction/index page for admins" do
#     click_link('See attractions')
#     expect(page).to have_content("Show #{@ferriswheel.name}")
#   end
#
#   it "does not suggest that admins go on a ride" do
#     click_link('See attractions')
#     expect(page).to_not have_content("Go on #{@ferriswheel.name}")
#   end
#
#   it "links to attractions/show page from attractions/index" do
#     click_link('See attractions')
#     click_link("Show #{@rollercoaster.name}")
#     expect(current_path).to eq("/attractions/1")
#   end
#
#   it "does not suggest that an admin go on a ride from attractions/show page" do
#     click_link('See attractions')
#     click_link("Show #{@rollercoaster.name}")
#     expect(page).to_not have_content("Go on this ride")
#   end
#
#   it "has a link for admin to edit attraction from the attractions/show page" do
#     click_link('See attractions')
#     click_link("Show #{@rollercoaster.name}")
#     expect(page).to have_content("Edit Attraction")
#   end
#
#   it "links to attraction/edit page from attraction/show page when logged in as an admin" do
#     click_link('See attractions')
#     click_link("Show #{@rollercoaster.name}")
#     click_link("Edit Attraction")
#     expect(current_path).to eq("/attractions/1/edit")
#   end
#
#   it "updates an attraction when an admin edits it" do
#     click_link('See attractions')
#     click_link("Show #{@rollercoaster.name}")
#     click_link("Edit Attraction")
#     fill_in("attraction[name]", :with => "Nitro")
#     click_button("Update Attraction")
#     expect(current_path).to eq("/attractions/1")
#     expect(page).to have_content("Nitro")
#   end
# end
