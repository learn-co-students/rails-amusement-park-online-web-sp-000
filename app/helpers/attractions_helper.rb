module AttractionsHelper

  def attractions_table_row(attraction)
    row = []
    current_user.admin ? (fragment="Show") : (fragment="Go On")
    row << content_tag(:td, attraction.name)
    row << content_tag(:td, attraction.tickets)
    row << content_tag(:td, link_to("#{fragment} #{attraction.name}", attraction_path(attraction)))

    content_tag(:tr) do
      row.join.html_safe
    end
  end
end
