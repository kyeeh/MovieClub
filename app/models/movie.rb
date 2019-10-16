class Movie < ApplicationRecord
  extend Movies::Api
  has_and_belongs_to_many :users

  # Class methods
  class << self

    # Search movies with a keyword as param
    def search(key_word)
      movies = []
      unless key_word.empty?
        api_movies = Movie.multi_search(key_word)["results"]
        api_movies.each do |movie_json|
          movie = set(movie_json)
          movies << movie if movie
        end
      end
      movies
    end

    # Get a movie by API id
    def get(param)
      movie_json = Movie.search_by_id(param["id"])
      movie = set(movie_json)
      movie.genre = genres(movie_json["genres"])
      movie
    end

    private

    # Movie instance mapper with JSON object
    def set(movie_json)
      if movie_json["title"] && movie_json["popularity"] >= 5
        movie = Movie.new
        movie.imdb_id = movie_json["id"]
        movie.title = movie_json["title"]
        if movie_json["poster_path"]
          movie.img_url = "https://image.tmdb.org/t/p/original" + movie_json["poster_path"]
        else
          movie.img_url = "https://nerdbot.com/wp-content/uploads/2018/12/not_available.png"
        end
        movie.release_date = movie_json["release_date"]
        movie.duration = movie_json["runtime"].to_s + "mins"
        movie.data = movie_json
        return movie
      end
      return nil
    end

    # Genres helper to parse JSON format from API
    def genres(data)
      genres_api = []
      data.each do |genre|
        genres_api << genre["name"]
      end
      genres_api.join(", ")
    end    
  end
end
