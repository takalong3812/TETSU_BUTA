Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"

  devise_for :users, controllers:{
   registrations: "user/registrations",
   sessions: 'user/sessions'
  }
  
  devise_for :admin,skip: [:registration, :passwords] ,controllers:{
    sessions: "admin/sessions"
  }
  
  namespace :user do
  end
  
  
  namespace :admin do
  end
  
  
  
end
