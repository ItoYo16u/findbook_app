class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews, dependent: :destroy
  has_many :books, through: :reviews
  has_many :user_users
  has_many :followings,through: :user_users,source: :follow
  has_many :reverse_of_user_users,class_name: "UserUser",foreign_key:"follow_id"
  has_many :followers, through: :reverse_of_user_users,source: :user

  def follow(other_user)
    unless self == other_user
      self.user_users.find_or_create_by(follow_id: other_user.id)
    end
  end
  
  def unfollow(other_user)
    user_user = self.user_users.find_by(follow_id: other_user.id)
    user_user.destroy if user_user
  end
  

  def following?(other_user)
    self.followings.include?(other_user)
  end
end
