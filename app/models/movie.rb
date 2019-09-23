class Movie < ApplicationRecord
  extend Movies::Api

  class << self
    def search(key_word)
      movies = []
      unless key_word.empty?
        api_movies = Movie.search_by_title(key_word)["Search"]
        #puts api_movies.inspect
        api_movies.each do |am|
          movie = Movie.new
          movie.imdb_id = am["imdbID"]
          movie.title = am["Title"]
          movie.img_url = am["Poster"]
          movies << movie
        end
      end
      movies
    end
  end
end
