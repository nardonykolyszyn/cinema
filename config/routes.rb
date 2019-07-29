# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :movies
      resources :rooms
      resources :functions do
        resources :show_functions, only: %i[index create destroy], module: :functions
      end
    end
  end
end
