module Api
  module V1
    class Api::V1::MoviesController < ApplicationController
			before_action :authenticate__request!

			def index
				movies = Movie.all
				render json: movies
			end

			def show
				movie = Movie.find(params[:id])
				render json: movie
			end

			def create
				movie = Movie.create!(movie_params)
				render json: movie, status: :created
			end

			def update
				movie = Movie.find(params[:id])

				if movie.update(movie_params)
					render json: movie
				end
			end

			def destroy
				movie = Movie.find(params[:id])

				movie.destroy

				render json: { message: 'Filme removido com sucesso.' }, status: :ok
			end

			private

			def movie_params
				params.require(:movie).permit(:name, :summary, :release_year, :gender)
			end
    end
  end
end


