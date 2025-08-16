class AddDirectorToMovies < ActiveRecord::Migration[8.0]
  def change
    add_column :movies, :director_references, :string
  end
end
