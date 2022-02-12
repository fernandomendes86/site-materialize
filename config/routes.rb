Rails.application.routes.draw do

  root 'page#index'

  get 'about', to: 'page#about'
  get 'contact', to: 'page#contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
