json.extract! user, :id, :name, :tickets, :happiness, :nausea, :height, :admin, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
