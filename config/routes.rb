Testhero::Application.routes.draw do
  root to: "pins#index"
  
  resources :pins do
    resources :comments, module: :pins
    member do
      put "like", to: "pins#upvote"
    end
  end

  resources :comments do
    member do
      put "like", to: "comments#upvote"
    end
  end

  devise_for :users

  get "/admin" => "admin/pins#index"

  namespace :admin do
    resources :pins
    resources :users
  end

end
