Rails.application.routes.draw do
 
  resources :bloggers, only: [:index, :new, :create, :show] 
  resources :destinations, only: [:index, :new, :create, :show]
  resources :posts, except: [:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
