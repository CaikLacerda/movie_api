FactoryBot.define do
  factory :movie do
    name { Faker::Movie.title}
    release_year { Faker::Number.between(from: 1950, to: 2025) }
    gender { Faker::Book.genre }
    summary { Faker::Lorem.paragraph}
  end
end