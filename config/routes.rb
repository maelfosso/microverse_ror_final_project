# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'users#home'

  resources :notifications, only: [:index]

  resources :users, only: [:index, :show], path: 'u'

  resources :likes, only: [:create, :update, :destroy]

  resources :posts, only: [:show, :create, :edit, :update, :destroy] do
    resources :likes, only: [:index]
    resources :comments, only: [:index]
  end

  resources :comments, only: [:create, :edit, :update, :destroy] do
    resources :likes, only: [:index]
    resources :comments, only: [:index], path: 'replies'
  end

  resources :friendships, only: [:index, :create, :update, :destroy], path: 'f'

  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}
end
