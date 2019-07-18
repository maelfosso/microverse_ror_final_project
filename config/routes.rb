# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'users#home'
  get '/friends', to: 'friendships#index'
  get '/notifications', to: 'notifications#index'
  get '/friends/requests', to: 'friendships#pending'

  resources :posts, only: [:new, :create, :update] do
    resources :likes, only: [:index]
    resources :comments, only: [:index]
  end

  resources :comments, only: [:new, :create, :update] do
    resources :likes, only: [:index]
    resources :comments, only: [:index], path: 'replies'
  end

  resources :likes, only: [:create, :update]
  resources :friendships, only: [:create, :update]
  resources :users, only: [:index, :show], path: 'u'

  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}
end
