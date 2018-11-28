Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'search#show'
      end

      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show]
    end
  end
end
