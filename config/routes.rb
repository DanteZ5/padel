Rails.application.routes.draw do
  root to: 'pages#home'

  get 'pages/home'

  resources :players, only: [:index, :show] do
    member do
      patch 'teams/asking', method: :patch
      patch 'teams/refused', method: :patch
      patch 'teams/accept', method: :patch
    end
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
