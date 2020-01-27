Rails.application.routes.draw do
  root :to => "welcome#index"

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
    resources :profiles
  end

  resources :profiles, only: :index

  # resources :clients do
  #   resources :projects
  # end

  resources :clients
  resources :projects
  resources :tasks
  resources :task_times do
    member do
      get :stop
    end
  end

  # get "/tasks/:id/stop", task_times_controller:
end
