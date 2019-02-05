Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events, only: [:index, :create]
      delete 'erase', to: 'events#erase'
      get 'events/actors/:id', to: 'events#filtered'
    end
  end

    # resources :events, only: [:index, :create], defaults: {format: :json}
    # delete 'erase', to: 'events#erase', defaults: {format: :json}
    # get 'evets/actors/:id', to: 'events#filtered', defaults: {format: :json}

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :actors, only: [:index, :create]
      put 'actors', to: 'actors#update'
      get 'actors/streak', to: 'actors#streak'
    end
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

