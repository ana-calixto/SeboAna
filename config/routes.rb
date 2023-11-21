Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users
      resources :tokens, only: [:create]
      resources :products
      resources :categories
      resources :orders   
    end
  end
end
