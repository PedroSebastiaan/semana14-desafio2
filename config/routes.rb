Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  resources :stories
  root 'stories#index'
  get 'users/sign_up', to: 'users#new'
  get 'users/:id', to: 'users#show', as: 'profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
