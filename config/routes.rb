Rails.application.routes.draw do
  resources :articles
  devise_for :catusers,controllers: {
    sessions: "catusers/sessions",
    registrations: "catusers/registrations"
  }

  post 'new_user_raction',  to:"reactions#new_user_reaction", as:"new_user_reaction"
   resources :comments, only: [:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
end
