class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

has_many :topics, dependent: :destroy
has_many :bookmarks, dependent: :destroy
has_many :likes, dependent: :destroy

 def admin?
   role == 'admin'
 end
 
  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end

end
