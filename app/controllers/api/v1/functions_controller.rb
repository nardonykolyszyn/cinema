# frozen_string_literal: true

module Api
  module V1
    class FunctionsController < ApiSitesController
      skip_before_action :assign_resource, only: %i[index create]

      def index
        @functions = Function.all.paginate(page: @page, per_page: 10)
        render json: {
          functions: ActiveModelSerializers::SerializableResource.new(@functions),
          status: :ok
        }
      end

      def show
        render json: {
          function: FunctionSerializer.new(@function),
          status: :ok
        }
      end

      def create
        @function = Function.new(function_params)
        @response = if @function.save
                      { function: FunctionSerializer.new(@function) }
                    else
                      {
                        errors: @function.errors.full_messages.to_sentence,
                        status: :unprocessable_entity
                      }
                    end
        render json: @response
      end

      def update
        @response = if @function.update(function_params)
                      { function: FunctionSerializer(@function), status: :ok }
                    else
                      {
                        errors: @function.errors.full_messages.to_sentence,
                        status: :unprocessable_entity
                      }
                    end
        render json: @response
      end

      def destroy
        @response = if @function.destroy
                      { message: 'Function has been deleted successfully' }
                    else
                      {
                        errors: @function.errors.full_messages.to_sentence,
                        status: :unprocessable_entity
                      }
                    end
        render json: @response
      end

      private

      def function_params
        params.require(:function).permit(
          :show_at, :movie_id, :room_id
        )
      end
    end
  end
end
