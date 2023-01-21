class User::PostsController < ApplicationController
    
    def create
     @post= Post.new(post_params)
    end
    
    def index
     @posts= Post.all
     @user= current_user
    end
end
