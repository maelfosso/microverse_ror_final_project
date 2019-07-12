# frozen_string_literal: true

Rails.application.routes.draw do
  get 'session/create'
  get 'session/destroy'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'auth/facebook/callback', to: 'session#create'
  get 'auth/failure', to: 'session#failure'

end
