module Api
  module V1
    class Api::V1::MoviesController < ApplicationController
			def index
				movies = Movie.all
				render json: movies
			end

			def show
				movie = Movie.find(params[:id])
				render json: movie
			end

			def create
				movie = Movie.new(movie_params)

				if movie.save
					render json: movie, status: :created
				else 
					render json: { errors: movie.erorrs.full_messages }, status: :unprocessable_entity
				end
			end

			def update
				movie = Movie.find(params[:id])

				if movie.update(movie_params)
					render json: movie
				else 
					render json: { errors: movie.erorrs.full_messages }, status: :unprocessable_entity
				end
			end

			def destroy
				movie = Movie.find(params[:id])

				movie.destroy

				render json: { message: 'Filme removido com sucesso.' }, status: :ok
			end

			private

			def movie_params
				params.require(:movie).permit(:name, :summary, :year_release)
			end
    end
  end
end


