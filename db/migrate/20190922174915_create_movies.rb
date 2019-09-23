class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :imdb_id
      t.text :data

      t.timestamps
    end
  end
end
