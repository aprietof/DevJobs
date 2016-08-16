Rails.application.routes.draw do
  root "jobs#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :jobs, :categories
end
