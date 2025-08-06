class Movie < ApplicationRecord
  validates :name, :summary, :release_year, :gender, presence: true
end