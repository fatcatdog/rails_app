Rails.application.routes.draw do
  resources :comments
  devise_for :users
  resources :searches do
    member do
      put "like", to: "searches#upvote"
      put "dislike", to: "searches#downvote"
    end
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    authenticated :user do
      root 'searches#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
