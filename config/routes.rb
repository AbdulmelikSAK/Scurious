Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update]
  get 'dashboard', to: 'users#dashboard', as: :dashboard

  resources :projects, except: [:destroy, :index] do
    resources :candidates, only: [:new, :create]
  end
  root to: 'projects#index'
  get 'api/projects', to: 'projects#api', as: :api
end
