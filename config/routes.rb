Testhero::Application.routes.draw do
  
  root to: "pins#index"
  
  devise_for :users
  resources :pins
  
end
