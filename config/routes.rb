# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'application#index'

  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}
end
