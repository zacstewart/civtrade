CivTrade::Application.routes.draw do
  resources :items, only: [:index, :show]

  resources :shops, path: '/', only: [:index, :create] do
    resources :reports, only: :create
  end

  root to: 'shops#index'
end
