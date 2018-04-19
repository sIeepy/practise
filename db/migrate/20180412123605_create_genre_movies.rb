class CreateGenreMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :genre_movies do |t|
      t.integer :movie_id
      t.integer :genre_id

      t.timestamps
    end

    add_index :genre_movies, :movie_id
    add_index :genre_movies, :genre_id
  end
end
