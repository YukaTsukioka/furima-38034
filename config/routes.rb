Rails.application.routes.draw do
 
  devise_for :users
  root to: "items#index"
  resources :prototypes, only: [:new] 
  
end
