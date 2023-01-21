Rails.application.routes.draw do
 
   root to: "homes#top"

  devise_for :users, controllers:{
   registrations: "user/registrations",
   sessions: 'user/sessions'
  }
  
  devise_for :admin,skip: [:registration, :passwords] ,controllers:{
    sessions: "admin/sessions"
  } 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
  namespace :user do
   resources :users
  end
  
  
  namespace :admin do
  end
  
  
  
end
