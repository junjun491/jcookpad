Rails.application.routes.draw do
  devise_for :users, :controllers =>{
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  root 'posts#index'
  get 'top' => "posts#index"

devise_scope :user do
  get "user/:id", :to => "users/registrations#detail"
  get "signup", :to => "users/registrations#new"
  get "login", :to => "users/sessions#new"
  get "logout", :to => "users/sessions#destroy"
end

resources :posts do

collection do
  get 'search'
end

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
