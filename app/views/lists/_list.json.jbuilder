json.extract! list, :id, :name, :url, :content, :description, :stars, :parsed, :pushed_at, :readme_raw_path, :created_at, :updated_at
json.url list_url(list, format: :json)
