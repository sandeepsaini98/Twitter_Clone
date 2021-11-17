json.extract! feed, :id, :username, :description, :created_at, :updated_at
json.url feed_url(feed, format: :json)
