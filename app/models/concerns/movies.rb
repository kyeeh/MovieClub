module Movies
  module Api
    extend ActiveSupport::Concern

    def multi_search(key_word)
      unless ENV["TMDB_API_KEY"]
        raise ArgumentError, "FATAL ERROR, NO API KEY PROVIDED"
      end        
      url = "https://api.themoviedb.org/3/search/multi?api_key=" + ENV["TMDB_API_KEY"]\
            + "&query=" + key_word + "&include_adult=false" + "&language=en-US"
      response = HTTP.get(url).to_s
      JSON.parse(response)
    rescue ArgumentError => e
      json_response = { error: e }
    end

    def search_by_id(param)
      unless ENV["TMDB_API_KEY"]
        raise ArgumentError, "FATAL ERROR, NO API KEY PROVIDED"
      end        
      url = "https://api.themoviedb.org/3/movie/" + param + "?api_key=" + ENV["TMDB_API_KEY"]\
            + "&include_adult=false" + "&language=en-US"
      response = HTTP.get(url).to_s
      JSON.parse(response)
    rescue ArgumentError => e
      json_response = { error: e }
    end
  end
end
