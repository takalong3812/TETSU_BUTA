class User::UsersController < ApplicationController
 before_action :move_to_signed_in, except: [:show]
    
 
 
 def show
  @user= User.find(params[:id])
  @posts= @user.posts
  @post= Post.new
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
