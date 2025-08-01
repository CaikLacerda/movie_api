class Movie < ApplicationRecord
  validates :name, :summary, :year_release, presence: true
end