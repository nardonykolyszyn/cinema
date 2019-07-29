# frozen_string_literal: true

module Api
  module V1
    class MoviesController < ApiSitesController

      def index
        @movies = Movie.all.paginate(page: @page, per_page: 10)
        render json: {
          movies: ActiveModelSerializers::SerializableResource.new(@movies),
          status: :ok
        }
      end

      def show
        render json: {
          movie: MovieSerializer.new(@movie),
          status: :ok
        }
      end

      def create
        @movie = Movie.new(movie_params)
        @response = if @movie.save
                      { movie: MovieSerializer.new(@movie) }
                    else
                      {
                        errors: @movie.errors.full_messages.to_sentence,
                        status: :unprocessable_entity
                      }
                    end
        render json: @response
      end

      def update
        @response = if @movie.update(movie_params)
                      { movie: MovieSerializer.new(@movie), status: :ok }
                    else
                      {
                        errors: @movie.errors.full_messages.to_sentence,
                        status: :unprocessable_entity
                      }
                    end
        render json: @response
      end

      def destroy
        @response = if @movie.destroy
                      { message: 'Movie has been deleted successfully' }
                    else
                      {
                        errors: @movie.errors.full_messages.to_sentence,
                        status: :unprocessable_entity
                      }
                    end
        render json: @response
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
