class AddOverviewToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :overview, :text
    add_column :movies, :tmdb_id, :string
    remove_column :movies, :data
  end
end
