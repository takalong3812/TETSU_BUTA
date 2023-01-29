class User::CommentsController < ApplicationController

 def create
   @post= Post.find(params[:post_id])
   @comment= current_user.commnets.new(comment_params)
   @comment.post_id= @post.id
   @comment.save
   redirect_to user_post_path(@post.id)
 end  
 
 
 private
 
 def comment_params
   params.require(:comment).permit(:comment, :user_id, :post_id)
 end  
 
end
