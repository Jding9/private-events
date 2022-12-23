Rails.application.routes.draw do
  devise_for :users
  
  root "events#index"

  resources :events do
    resources :attendances, only: [:new, :create, :destroy]
    member do
      post 'attend'
      post 'unattend'
    end
  end
  get 'users/:id', to: 'users#show', as: "user"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
