class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_attached_file :avatar, styles: { medium: "300x300", thumb: "100x100" },:storage => :cloudinary, :path => ':id/:style/:filename'

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :avatar, attachment_presence: true

  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :posts, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.avatar = "https://graph.facebook.com/#{auth["uid"]}/picture?type=large"
      user.name = auth.info.name.to_s.split[0]
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end      
  end

  #Removes friend association
  def remove_friend(friend)
    friends.destroy(friend)
  end

end