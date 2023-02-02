class Admin::UsersController < ApplicationController
    
  def index
  @users=User.all
  end    
 
  def show 
   @user= User.find(params[:id])
   @posts= @user.posts
  end
  
  
  private
  
  def user_params
   params.require(:user).permit(:name, :introduction, :image)
  end 
    
end
