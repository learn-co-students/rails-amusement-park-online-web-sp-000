class Admin < ActiveRecord::Base

end


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
