# frozen_string_literal: true

Rails.application.routes.draw do
  resources :articles
  root 'page#home'

  get 'about', to: 'page#about'
  get 'contact', to: 'page#contact'

  get 'signup', to: 'users#new'
  # post 'signup', to: 'users#signup'
  resources :users, except: :new
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
