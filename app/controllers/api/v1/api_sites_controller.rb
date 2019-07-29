# frozen_string_literal: true

module Api
  module V1
    class ApiSitesController < ApplicationController
      protect_from_forgery with: :null_session
      before_action :assign_resource
      before_action :assign_page

      private

      # It assigns a default param for pagination.
      def assign_page
        @page = params[:page] || 1
      end

      # Automatically find the model by id.
      def assign_resource
        resource_name = controller_name.singularize
        resource = controller_name.classify.constantize.find(params[:id])
        instance_variable_set("@#{resource_name}", resource)
      end
    end
  end
end
