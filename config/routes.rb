# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  resources :posts

  root 'posts#index'
  get '/:page', to: 'static_pages#show', as: 'static_pages'
end
