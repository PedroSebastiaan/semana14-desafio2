Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'  
      }
  resources :stories
  root 'stories#index'
  get 'users/:id', to: 'users#show', as: 'profile'
  patch 'change/:id', to: 'users#modify', as: 'change'
  get 'admin/panel', to: 'users#panel'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
