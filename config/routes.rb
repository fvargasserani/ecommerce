Rails.application.routes.draw do
  resources :users

  resources :orders

  resources :products 

  resources :variants

  resources :categories do
    member do
      post :subcategory
    end
  end
  
  root 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
