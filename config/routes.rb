Rails.application.routes.draw do
  resources :users
  resources :orders
  resources :products do
    member do
      post :variant
    end
  end
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
