Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles do  #, only: [:show, :index, :new, :create, :edit, :update, :destroy]
    resources :comments
  end
end