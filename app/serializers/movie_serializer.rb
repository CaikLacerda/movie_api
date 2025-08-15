class MovieSerializer < ActiveModel::Serializer
  attributes :id, :name, :summary, :release_year, :gender
end