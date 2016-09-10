Rails.application.routes.draw do
  resources :items, only: :index

  resources :shops, only: [:new, :index, :create] do
    resources :reports, only: :create
  end
  resource :search, only: :show

  resource :signup
  resource :session
  resource :verification

  resources :users, only: :show

  root to: 'shops#index'
end
