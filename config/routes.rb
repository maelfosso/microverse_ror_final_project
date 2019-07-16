# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'users#home'

  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  resources :posts do
    resources :likes
    resources :comments
  end

  resources :friendships, only: [:create, :update]

  get '/search', to: 'users#index'
  get '/notifications', to: 'notifications#index'
  get '/friends', to: 'friendships#index'
  get '/friends/requests', to: 'friendships#pending'
  get '/:username', to: 'users#timeline'
end
