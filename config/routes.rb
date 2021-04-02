Rails.application.routes.draw do
  
  resources :users

  resources :orders

  resources :products 

  resources :variants

  resources :categories do
    resources :subcategories, controller: 'categories/subcategories'
  end
  
  root 'products#index'

end
