Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users
      resources :tokens, only: [:create]
      resources :products, only: %i[index show create]
      resources :categories, only: %i[show index create]
      resources :orders, only: %i[index show create]
      
    end
  end
end