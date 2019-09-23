module Movies
  module Api
    extend ActiveSupport::Concern

    def find_by_title(key_word)
      unless ENV["OMDB_API_KEY"]
        raise ArgumentError, "FATAL ERROR, NO API KEY PROVIDED"
      end      
      url = "http://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]}&t=#{key_word}"
      response = HTTP.get(url).to_s
      json_response = JSON.parse(response)            
    end

    def find_by_id(id)
      unless ENV["OMDB_API_KEY"]
        raise ArgumentError, "FATAL ERROR, NO API KEY PROVIDED"
      end      
      url = "http://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]}&i=#{id}"
      response = HTTP.get(url).to_s
      json_response = JSON.parse(response)      
    end

    def search_by_title(key_word)
      unless ENV["OMDB_API_KEY"]
        raise ArgumentError, "FATAL ERROR, NO API KEY PROVIDED"
      end
      url = "http://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]}&s=#{key_word}"
      response = HTTP.get(url).to_s
      puts response
      json_response = JSON.parse(response)      
    end      
  end
end
