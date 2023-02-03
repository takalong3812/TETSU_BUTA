class User::UsersController < ApplicationController
 before_action :move_to_signed_in, except: [:show]
    
 
 
 def show
  @user= User.find(params[:id])
  @posts= @user.posts
  @post= Post.new
 end
 
 def edit
   @user= User.find(params[:id])
    if @user == current_user
    else
     redirect_to user_user_path(current_user)
    end
 end  
 
 def update
    @user= User.find(params[:id])
    if @user.update(user_params)
     flash[:notice]= 'You have updated user successfully'
     redirect_to user_user_path(current_user)
    else
      render:edit
    end
 end
 

 
 
 private
 
  def move_to_signed_in
    unless user_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to  'user/users/sign_in'
    end
  end
 
  def user_params
   params.require(:user).permit(:name, :introduction, :image)
  end 
 
 
end
