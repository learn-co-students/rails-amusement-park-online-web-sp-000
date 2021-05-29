<%= form_tag users_path do %>
  <label>Username:</label><br>
  <%= text_field_tag :'user[name]' %><br>

  <label>Height:</label><br>
  <%= number_field_tag :'user[height]' %></br>

  <label>Happiness:</label><br>
  <%= number_field_tag :'user[happiness]' %><br>

  <label>Nausea:</label><br>
  <%= number_field_tag :'user[nausea]' %></br>

  <label>Tickets:</label><br>
  <%= number_field_tag :'user[tickets]' %></br>

  <label>Password:</label><br>
  <%= password_field_tag :'user[password]' %></br>
  <%= submit_tag "Create User" %>
<% end %>
