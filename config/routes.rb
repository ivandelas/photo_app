Rails.application.routes.draw do
  resources :images
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'welcome#index'
end
