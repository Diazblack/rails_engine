Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get ':id/favorite_customer', to: 'customer#show'
        get ':id/revenue', to: 'revenue#show'
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'search#show'
      end

      namespace :customers do
        get ':id/favorite_merchant', to: 'merchant#show'
      end

      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
