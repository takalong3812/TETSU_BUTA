class User::UsersController < ApplicationController
    
 
 
 def show
  @user= User.find(params[:id])
  @posts= @user.posts
  @post= Post.new
 end
 
 
 private
 
  def user_params
   params.require(:user).permit(:name, :introduction, :image)
  end 
 
 
end
