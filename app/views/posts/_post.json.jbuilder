json.extract! post, :id, :title, :content, :url, :repo_url, :created_at, :updated_at
json.url post_url(post, format: :json)
