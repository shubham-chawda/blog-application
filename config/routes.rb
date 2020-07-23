Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"

  resources :posts do
    member do
      get "user" => "posts#find_user"
      post "publish" => "posts#publish_post"
    end
  	resources :comments
  end

  resources :followings, only: [:create, :destroy]

end
