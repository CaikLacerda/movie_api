class RenameDirectorReferenceToDirectorIdInMovies < ActiveRecord::Migration[8.0]
  def change
    rename_column :movies, :director_references, :director_id
  end
end
