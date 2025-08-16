class Movie < ApplicationRecord
  belongs_to :director

  validates :name, :summary, :release_year, :gender, presence: true
end