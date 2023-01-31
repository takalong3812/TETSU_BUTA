class User::GuestController < ApplicationController
 def new_guest
     user= User.find_or_create_by!(email: 'guest@example.com') do |user|
        user.image= image_tag'no_image.jpg', size: "100x100" 
        user.password= SecureRandom.urlsafe_base64 
        user.password_confirmation= user.password
        user.name= 'guest'
        user.introduction= 'hello'
    end 
    sign_in user
    redirect_to user_user_path(user), notice:'ゲストユーザーとしてログインしました。'
 end

end
