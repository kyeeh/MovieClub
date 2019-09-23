class UsersMoviesRelationship < ActiveRecord::Migration[6.0]
  def change
    create_table :users_movies, id: false do |t|
      t.belongs_to :user
      t.belongs_to :movies
    end    
  end
end
