module Movies
  module Api
    extend ActiveSupport::Concern

    def find_by_title(title)
      omdb_api = Omdb::Api::Client.new(api_key: ENV["OMDB_API_KEY"])
      omdb_api.find_by_title(title)
    end

    def find_by_id(id)
      omdb_api = Omdb::Api::Client.new(api_key: ENV["OMDB_API_KEY"])
      omdb_api.find_by_id(id)
    end

    def search(param) 
      omdb_api = Omdb::Api::Client.new(api_key: ENV["OMDB_API_KEY"])
      omdb_api.search(param)
    end      
  end
end
