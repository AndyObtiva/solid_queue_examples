json.extract! user, :id, :full_name, :email, :last_activity_at, :created_at, :updated_at
json.url user_url(user, format: :json)
