class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300", thumb: "100x100" },:storage => :cloudinary, :path => ':id/:style/:filename'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :posts, dependent: :destroy

  #Removes friend association
  def remove_friend(friend)
    current_user.friends.destroy(friend)
  end

end