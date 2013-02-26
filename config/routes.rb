CivTrade::Application.routes.draw do
  resources :items, only: [:index, :show]

  resources :shops, only: [:index, :create] do
    resources :reports, only: :create
  end

  resources :bounties, except: [:new, :edit] do
    resources :pledges, only: :create
  end

  resource :signup
  resource :session
  resource :verification

  resources :users, only: :show

  root to: 'shops#index'
end
