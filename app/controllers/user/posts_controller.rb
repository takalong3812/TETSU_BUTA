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
    
   def search
     if params[:title].present?
      @posts = Post.where('title LIKE ?', "%#{params[:title]}%")
     else
      @posts = Post.none
     end
   end

    
    def index
     @posts= Post.all
     @posts= params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
      if params[:tag_ids]
      @posts = []
      params[:tag_ids].each do |key, value|      
        @posts += Tag.find_by(name: key).posts if value == "1"
      end
      @posts.uniq!
      end
    end  
    
    
    
    def show
     @post= Post.find(params[:id])
     @user= @post.user
     @new_post= Post.new
    end 
   
   
  private

    def post_params
     params.require(:post).permit(:title, :impression, :image, :address, :user_id, tag_ids: [])
    end   
    
     
    
end
