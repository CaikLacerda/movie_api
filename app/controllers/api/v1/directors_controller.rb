module Api
  module V1
    class Api::V1::DirectorsController < ApplicationController
      before_action :authenticate_request!

      def index
        directors = if params[:q].present?
          Director.where("name ILIKE ?", "%#{params[:q]}%")
        else
          Director.all
        end
        render json: directors
      end

      def show
        director = Director.find(params[:id])
        render json: director
      end

      def create
        director = Director.create!(director_params)

        if director.save!
          render json: { message: "Diretor criado com sucesso!"}, status: :created
        else
          render json: { errors: director.error.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        director = Director.find(params[:id])

        if director.update(director_params)
          render json: director
        end
      end

      def destroy
        director = Director.find(params[:id])

        director.destroy

        render json: { message:"Diretor excluido com sucesso."}, status: :ok
      end

      private

      def director_params
        params.require(:director).permit(:name)
      end
    end
  end
end