json.extract! list_entry, :id, :title, :url, :description, :category, :subcategory, :list_id, :created_at, :updated_at
json.url list_entry_url(list_entry, format: :json)
