Rails.application.routes.draw do
  get 'products/:id' => 'catalog#view'
  devise_for :users
  root 'posts#index'

  resources :tags

  resources :posts do
    resource :map
  end
end