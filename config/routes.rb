# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :json_api do
    resources :users, only: %w[index show create update destroy]

    resources :lists, only: %w[index show create update destroy] do
      scope module: :lists do
        resource :user, only: %w[show update destroy]
        resources :todos, only: %w[index show create update destroy]

        namespace :relationships do
          resource :user, only: %w[update]
          post :todos, to: 'todos#create'
          patch :todos, to: 'todos#update'
          delete :todos, to: 'todos#destroy'
        end
      end
    end

    resources :todos, only: %w[index show create update destroy] do
      scope module: :todos do
        resource :list, only: %w[show update destroy]
        namespace :relationships do
          resource :list, only: %w[update]
        end
      end
    end
  end
end
