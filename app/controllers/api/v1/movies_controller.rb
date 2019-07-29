# frozen_string_literal: true

module Api
  module V1
    class MoviesController < ApiSitesController
      def index
        @movies = Movie.all
        render json: { movies: MovieSerializer.new(@movies).serializable_hash }
      end

      def show
        @movie = Movie.find(params[:id])
        render json: { movie: MovieSerializer.new(@movie) }
      end

      def create
        @movie = Movie.new(movie_params)
        if @movie.save
          @response = { movie: MovieSerializer.new(@movie) }
        else
          @response = { errors: @movie.errors }
        end
        render json: @response
      end

      def update
      end

      def destroy
      end

      private

      def movie_params
        params.require(:movie).permit(
          :name, :year, :gender
        )
      end
    end
  end
end
