Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects, except: [:destroy, :index] do
    resources :applications, only: [:new, :create]
  end
  root to: 'projects#index'
  get 'api/:search', to: 'projects#api', as: :api
end
