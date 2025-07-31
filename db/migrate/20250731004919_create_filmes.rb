class CreateFilmes < ActiveRecord::Migration[8.0]
  def change
    create_table :filmes do |t|
      t.string :name
      t.text :summary
      t.integer :year_release

      t.timestamps
    end
  end
end
