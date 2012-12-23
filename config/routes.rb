CivTrade::Application.routes.draw do
  resources :items, only: [:index, :show]

  resources :shops, path: '/', only: [:index, :create] do
    resources :reports, only: :create
  end

  resource :signup
  resource :session

  resources :users

  root to: 'shops#index'
end
