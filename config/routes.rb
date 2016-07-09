Rails.application.routes.draw do
  resources :measures
  resources :users
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'dashboard/index'
  root 'dashboard#index'
  #root 'static_pages#home'
end
