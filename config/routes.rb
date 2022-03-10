Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pools do
    resources :bookings, only: [ :new, :create ]
    collection do
      get :my_pools
    end
  end
  resources :bookings, only: [:index, :destroy, :edit, :update, :show] do
    resources :reviews, only: [:create, :new]
  end
end
