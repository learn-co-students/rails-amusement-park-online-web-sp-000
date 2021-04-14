User.where("boolean_column = 't'").update_all(boolean_column: 1)

rakefile to convert 

20 years combind shopify experience
with shopify theme setup
custom maps
site nav setup
basic branding
back end setup (product manegment and setup variance, collections, fufuillment, supply chain, erp integrations and setup, data warehousing, shipping and 3pl manegement, shipping apis, easy boos, shippo etc, 3po integrations)
custom app dev + setup
knowledge of all apps for you to run your store( reviws, upsells, instagram connection, livechat)
branding package (color scheme, logo, images, and topography)
We are a team of engineers and designers in manhattan, ny
Weve worked with dropship stores, dtc brands, shopify plus merchants, and launching brand new stores


$80/hr

Portfolio
Ship Covet
auratenewyork.com
diamondbraces.com
happilywhole.com
lyvecom.com
smilify.com
hydrant.com
drinkjade.co

Who are we?

We are a team of engineers and designers with over 20 years of combined Shopify experience, based out of Manhattan, NY.

What do we bring?

Our Full-Stack Engineers are driven by building impactful products and communities with a flair for JavaScript, React/Redux, Liquid, ERB, and Rails. Our Designers create full branding packages for your business ( color scheme, logo, images, and topography ). Our team specializes in all the knowledge needed for you to run your store.

What can you expect?

Have you ever visited a website that wowed you as soon as it loads? That's our Mission. From start to finish our team will be with you every step of the way. From our custom app dev + setup, back-end setup ( product management, setup variance, collections, fulfillment, supply chain, ERP integrations, data-warehousing. 3PL management, shipping APIs, 3PO integrations, etc.), to full branding packages, we make sure you and your business leave happy campers.





Next Feature to Implement
  1) Feature Test: User Signup successfully signs up as non-admin                                                            
  Failure/Error: user = User.new(params[:user])                                                                                                                                                                                                   ActiveModel::ForbiddenAttributesError:                                                                                    ActiveModel::ForbiddenAttributesError


  =begin <%= form_for @user do |f| %>
 <%= f.select :name, options_from_collection_for_select(User.all, :id, :name) %><br>
 
 <%= f.label :password %>
 <%= f.password_field :password %>

 <%= f.submit %>
<% end %>
 =end