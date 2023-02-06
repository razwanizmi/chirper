# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:create]
  get 'signup' => 'users#new'
  get 'about' => 'pages#about'
  get 'settings' => 'pages#settings'

  resource :session, only: %i[create destroy]
  get 'signin' => 'sessions#new'

  # Defines the root path route ("/")
  root 'chirps#index'
end
