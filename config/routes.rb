Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :contents, only: [:index]
  resources :serif_collections, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/about' => 'top_pages#about'
  get 'serif_collections/short' => 'serif_collections#short'
  root 'top_pages#index'

  get '*path', controller: 'application', action: 'render_404'
end
