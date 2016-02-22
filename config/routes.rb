Testhero::Application.routes.draw do
  
  root "pins#index"
  
  devise_for :users
  resources :pins
  
end
