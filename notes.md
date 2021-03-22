<% if @user.errors.any? %>
    <% @user.errors.full_message.each do |error| %>
        <li><%= error %></li>
        <% end %>
<% end %>