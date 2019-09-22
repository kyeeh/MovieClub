class AddFieldsToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :img_url, :string
    add_column :movies, :title, :string
    add_column :movies, :release_date, :date
    add_column :movies, :genre, :string
    add_column :movies, :duration, :string
  end
end
