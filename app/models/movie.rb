class Movie < ApplicationRecord
  extend Movies::Api
  has_and_belongs_to_many :users


  class << self
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

    def get(param)
      movie_json = Movie.search_by_id(param["id"])
      movie = set(movie_json)
      return movie
    end

    private

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
        movie.data = movie_json
        return movie
      end
      return nil
    end
  end
end
