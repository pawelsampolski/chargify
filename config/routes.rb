Rails.application.routes.draw do

  resources :customers do 
    resources :subscriptions do
      resources :products
    end
  end
  
end
