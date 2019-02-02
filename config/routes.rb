Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events, only: [:index, :create]
      delete 'erase', to: 'events#erase'
      get 'events/actors/:id', to: 'events#filtered'
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :actors, only: [:index]
    end
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

