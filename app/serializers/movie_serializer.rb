class MovieSerializer < ActiveModel::Serializer
  attributes :name, :summary, :release_year, :gender
end