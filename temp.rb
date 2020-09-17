<%= form_for (@user), :url => signin_path do |f| %>

    <%= f.label :name %><br>
    <%= f.collection_select :name, User.all, :id, :name %> <br>

    <%= f.label :password %>
    <%= f.password_field :password %><br>

    <%= button_to "Sign In", users_path %>
    <%= f.submit %>
<% end %>


