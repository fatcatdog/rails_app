Rails.application.routes.draw do
  devise_for :users
  resources :searches do
    member do
      put "like", to: "search#upvote"
      put "dislike", to: "search#downvote"
    end
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'searches#index'
end
