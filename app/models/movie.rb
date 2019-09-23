class Movie < ApplicationRecord
  extend Movies::Api

  class << self
    def search(key_word)
      movies = []
      api_movies = Movie.search_by_title(key_word)["Search"]
      #puts api_movies.inspect
      api_movies.each do |am|
        movie = Movie.new(imdb_id: am["imdb_id"], title: am["Title"],
                           img_url: am["Poster"], release_date: am["Year"],
                           duration: 0)
        movies << movie
        puts movie.inspect
      end
      movies
    end
  end
end
