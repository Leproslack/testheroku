Testhero::Application.routes.draw do
  
  


  root to: "pins#index"
  resources :pins

  devise_for :users
    
end
