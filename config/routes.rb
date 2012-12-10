CivTrade::Application.routes.draw do
  resources :shops, path: '/', only: [:index, :create] do
    resources :reports, only: :create
  end

  root to: 'shops#index'
end
