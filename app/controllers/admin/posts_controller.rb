class Admin::PostsController < ApplicationController
    
  def show
   @post= Post.find(params[:id])
   @user= @post.user
  end 
  
  
  
  private

    def post_params
     params.require(:post).permit(:title, :impression, :image, :address, :user_id, tag_ids: [])
    end
  
  
end
