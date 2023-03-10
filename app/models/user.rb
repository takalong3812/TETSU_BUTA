class User < ApplicationRecord
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end  
  
 
  
  has_one_attached :image
   
  
  validates :name,presence: true
  validates :introduction,presence: true
  
      
 
  
end
