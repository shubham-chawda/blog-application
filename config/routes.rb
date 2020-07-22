Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"

  resources :posts do
    member do
      post "publish" => "posts#publish_post"
    end
  	resources :comments
  end

end
