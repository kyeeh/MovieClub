json.extract! movie, :id, :imdb_id, :data, :created_at, :updated_at
json.url movie_url(movie, format: :json)
