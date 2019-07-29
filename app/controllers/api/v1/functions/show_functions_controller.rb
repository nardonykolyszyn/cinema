# frozen_string_literal: true

module Api
  module V1
    class Functions::ShowFunctionsController < ApiSitesController
      skip_before_action :assign_resource
      before_action :set_function, except: :destroy

      def index
        @show_function = @function.show_functions.paginate(page: @page, per_page: 10)
        render json: {
          show_function: ActiveModelSerializers::SerializableResource.new(@show_function),
          status: :ok
        }
      end

      def create
        @client = Client.find_or_initialize_by(show_function_params[:client])
        @client.save unless @client.persisted?

        @show_function = @function.show_functions
                                  .build(show_function_params.except(:client))
        @show_function.client = @client

        @response = if @show_function.save
                      { show_function: ShowFunctionSerializer.new(@show_function) }
                    else
                      {
                        errors: @show_function.errors.full_messages.to_sentence,
                        status: :unprocessable_entity
                      }
                    end
        render json: @response
      end

      def destroy
        @show_function = ShowFunction.find(params[:id])
        @response = if @show_function.destroy
                      { message: 'Show function has been deleted successfully' }
                    else
                      {
                        errors: @show_function.errors.full_messages.to_sentence,
                        status: :unprocessable_entity
                      }
                    end
        render json: @response
      end

      private

      def set_function
        @function = Function.find(params[:function_id])
      end

      def show_function_params
        params.require(:show_function).permit(
          :starts_at, :ends_at,
          client: %i[first_name last_name document_type document_number]
        )
      end
    end
  end
end
