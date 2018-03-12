Rails.application.routes.draw do
  get 'teams/create'

  root to: 'pages#home'
  get 'players/index'

  get 'pages/home'

  resources :players, only: [:index] do
    member do
      resources :teams, only: [:create, :update]
    end
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
