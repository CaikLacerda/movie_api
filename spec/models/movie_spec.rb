# spec/models/movie_spec.rb
require 'rails_helper'

RSpec.describe Movie, type: :model do
  it "create a validated movie with factory" do
    movie = FactoryBot.create(:movie)
    expect(movie).to be_valid
  end
end