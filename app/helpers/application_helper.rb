module ApplicationHelper
  def sign_out_link_conditional
    # form = <<-HTML
    #   <%= form_tag ({controller: 'sessions', action: 'destroy', method: 'post', class: "navbar-brand"}) do %>
    #     <input type=submit value='Log Out'>
    #   <% end %>
    # HTML
    # form
    link_to("Log Out", '/signout', class:"navbar-brand", method: :delete) if logged_in?
  end

  def sign_up_link_conditional
    link_to("Sign Up", '/signup', class:"navbar-brand") if !logged_in?
  end

  def sign_in_link_conditional
    link_to("Sign In", '/signin', class:"navbar-brand") if !logged_in?
  end

  def admin_link_conditional
    link_to("ADMIN", '/admin', class:"navbar-brand") if admin?
  end
end
