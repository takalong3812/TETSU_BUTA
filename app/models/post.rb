class Post < ApplicationRecord

has_one_attached :image
belongs_to :user
validates :title,presence:true
validates :impression,presence:true, length:{maximum: 200} 

end
