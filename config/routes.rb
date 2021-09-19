Rails.application.routes.draw do
  get 'results/new'
  root 'static_pages#home'
  get '/action', to: "static_pages#action"
  get '/contact', to: "static_pages#contact"
  get "/login", to: "login_edituser#login"
  post "/login", to: "login_edituser#create"
  delete "/logout", to: "login_edituser#destroy"
  resources :members, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :results, only: [:index, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
