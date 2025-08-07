# spec/requests/api/v1/movies_spec.rb
require 'rails_helper'

RSpec.describe "Api::V1::Movies", type: :request do
  describe "GET /api/v1/movies" do
    it "return a movie list" do
      FactoryBot.create_list(:movie, 3)

      get "/api/v1/movies"

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end
end
