class User::PostsController < ApplicationController
    
    def create
     @post= Post.new(post_params)
     @post.user_id= current_user.id
      if @post.save
      flash[:notice]= '投稿に成功しました'
      redirect_to user_post_path(@post.id)
      else
       @posts= Post.all
       @user= current_user
       render :index
      end       
    end
    
    def index
     @posts= Post.all
     @post= Post.new
     @user= current_user
    end
    
    def show
     @post= Post.find(:params[:id])
     @user= @post.user
     @new_post= Post.new
    end 
    
  private
    def post_params
     prams.require(:post).permit(:title, :impression, :image, :user_id)
    end   
    
     
    
end
