Rails.application.routes.draw do
  get 'items/index'

  resources :items do
    member do
      get :mark_as_done
    end
  end
  resources :tags

  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
