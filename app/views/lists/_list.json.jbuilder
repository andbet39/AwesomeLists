json.extract! list, :id, :name, :url, :content, :description, :stars, :parsed, :created_at, :updated_at
json.url list_url(list, format: :json)
