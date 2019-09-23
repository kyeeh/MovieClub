module Movies
  module Api
    extend ActiveSupport::Concern

    def find_by_title(key_word)
      url = "http://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]}&t=#{key_word}"
      response = HTTP.get(url).to_s
      json_response = JSON.parse(response)            
    end

    def find_by_id(id)
      url = "http://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]}&i=#{id}"
      response = HTTP.get(url).to_s
      json_response = JSON.parse(response)      
    end

    def search_by_title(key_word)
      url = "http://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]}&s=#{key_word}"
      response = HTTP.get(url).to_s
      json_response = JSON.parse(response)
    end      
  end
end
