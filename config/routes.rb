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
   post '/guests/guest_sign_in', to: 'guests#new_guest'
   resources :posts do
   get :search, on: :collection
   resources :likes, only: [:create, :destroy]
   resources :comments, only:[:create, :destroy]
   end
  
  end
 
  namespace :admin do
  root to: 'homes#top'
  resources :users
  resources :posts do
  resources :comments, only:[:destroy]
  end

 end
  
  
  
end
