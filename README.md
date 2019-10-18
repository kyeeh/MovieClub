# MovieClub README

* Ruby version: ruby-2.6.3

* System dependencies made with bundle gem.

* Configuration made with bundle, Movie API key must be a environment variable (ENV["TMDB_API_KEY"]) exported to stablish comunication with the API server.

* Database creation with rails db:create.

* Database initialization rails db:migrate.

* How to run the test suite
  Run "bundle exec rspec" in your terminal.

* Services (job queues, cache servers, search engines, etc.)
  Search engine made with https://www.themoviedb.org using the API for movie database. An API key should be created and defined as environment variable to loaded as param for API authentication.

* Deployment instructions
  $rails s
* ...
