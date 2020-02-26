json.extract! user, :id, :name, :password, :password_digest, :nausea, :happiness, :tickets, :height, :created_at, :updated_at
json.url user_url(user, format: :json)
