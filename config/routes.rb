Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: 'posts#index'

  resources :home

  get 'user/:id/list', to: 'posts#list', as: 'user_list'

  get 'user/:id/favorite', to: 'likes#list', as: 'like_list'

  devise_scope :user do
    get 'user/:id', to: 'users/registrations#detail'
    get 'signup', to: 'users/registrations#new'
    get 'login', to: 'users/sessions#new'
    get 'logout', to: 'users/sessions#destroy'
  end

  resources :posts do
    resources :likes, only: %i[create destroy]

    collection do
      get 'search'
    end
  end

  # APIコントローラへのルーティング
  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :posts, only: %i[index show create update]
      resources :likes, only: %i[index show create update]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
