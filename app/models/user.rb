class User < ApplicationRecord
  has_many :feeds
  has_many :passive_relationships,class_name: "Relationship",
                                  foreign_key: "followed_id",
                                  dependent: :destroy
  has_many :followers,through: :passive_relationships, source: :follower

  has_many :active_relationships,class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :followings,through: :active_relationships, source: :followed
  def follow(user)
    active_relationships.create(followed_id: user.id)
  end 

  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy 
  end 

  def following?(user)
    following_ids.include?(user.id)
  end 

  # has_many :following, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  # has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

  # has_many :following_user, through: :following, source: :follower
  # has_many :follower_user, through: :follower, source: :following

  # def follow(user_id)
  #   following.create(follower_id: user_id)
  # end

  # def unfollow(user_id)
  #   following.find_by(follower_id: user_id).destroy
  # end

  # def following?(user_id)
  #   following_user.include?(user_id)
  # end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def username
    return self.email.split('@')[0].capitalize 
  end           

  def self.search(search)
    
    if search 
      @user = User.where(email: search)
    end
  end
end
