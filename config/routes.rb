Rails.application.routes.draw do
  root "jobs#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users do
    # nested resource for job_applications
    resources :job_applications, only: [:show, :index]
  end

  resources :jobs, :categories, :job_applications
end
