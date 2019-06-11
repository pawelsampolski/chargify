Rails.application.routes.draw do

  resources :products
  resources :customers do 
    resources :subscriptions 
  end
  
end
