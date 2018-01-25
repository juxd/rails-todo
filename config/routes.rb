Rails.application.routes.draw do
  root 'items#index'
  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get 'items/index'

  resources :items do
    member do
      get :mark_as_done
    end
  end
  resources :tags
  
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
