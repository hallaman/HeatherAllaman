json.extract! podcast, :id, :title, :main_image, :description, :created_at, :updated_at
json.url podcast_url(podcast, format: :json)