Testhero::Application.routes.draw do
  root to: "pins#index"
  
  resources :pins do
    member do
      put "like", to: "pins#upvote"
    end
  end

  devise_for :users
end
