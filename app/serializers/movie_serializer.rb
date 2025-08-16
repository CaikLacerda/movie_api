class MovieSerializer < ActiveModel::Serializer
  attributes :id, :name, :summary, :release_year, :gender, :director_id
end