Rails.application.routes.draw do
  resources :lookups
  resources :measures
  resources :users
  resources :dashboard
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'dashboard/index'
  root 'lookups#index'
  #root 'static_pages#home'
end
