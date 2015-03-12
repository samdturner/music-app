Rails.application.routes.draw do
  get 'albums/new'

  get 'albums/show'

  get 'albums/edit'

  get 'bands/new'

  get 'bands/edit'

  get 'bands/index'

  get 'bands/show'

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:create, :edit, :show, :update, :destroy] do
    resources :tracks, only: [:new]
  end
  resources :tracks, only: [:create, :edit, :show, :update, :destroy]
end
