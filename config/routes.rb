Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  get 'products/:id' => 'catalog#view'

  root 'posts#index'

  resources :tags

  resources :posts do
    resource :map
    resources :charges
  end
  resources :orders
end