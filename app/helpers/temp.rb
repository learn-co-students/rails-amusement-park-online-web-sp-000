def table_of_attractions(attractions)
  @attractions.each do |attraction|
    content_tag(:tr) do
      content_tag(:td, attraction.name)
      content_tag(:td, attraction.tickets)
      content_tag(:td) do
        if current_user.admin
          link_to("Show #{attraction.name}", attraction_path(attraction))
        else
          link_to("Go on #{attraction.name}", attraction_path(attraction))
        end
      end
    end
  end
end
