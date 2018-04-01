Rails.application.routes.draw do
  root to: 'pages#home'

  resources :players, only: [:index, :show] do
    member do
      patch 'teams/asking', method: :patch # voir si method est useless
      patch 'teams/refused', method: :patch
      patch 'teams/accept', method: :patch
    end
  end

  resources :teams

  resources :divisions, only: [:index, :create, :destroy]  do
    post 'generator'
    delete 'destructor'
    member do
      resources :matches, only: [:index] # not sure it's necessary
      get 'teams/index_division'
    end
  end

  get 'matches/report'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
