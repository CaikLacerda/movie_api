class UpdateYearReleaseAddGender < ActiveRecord::Migration[8.0]
  def change
    add_column :movies, :gender, :string

    rename_column :movies, :year_release, :release_year
  end
end
