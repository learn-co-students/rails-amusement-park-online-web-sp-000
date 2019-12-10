json.extract! user, :id, :name, :password_digest, :happiness, :nausea, :height, :tickets, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)
