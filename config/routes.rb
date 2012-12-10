CivTrade::Application.routes.draw do
  resources :shops, path: '/', only: [:index, :create]
  root to: 'shops#index'
end
