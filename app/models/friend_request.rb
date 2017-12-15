class FriendRequest < ApplicationRecord
	validate :not_friends
	belongs_to :user
	belongs_to :friend, class_name: 'User'

    # This method will build the actual association and destroy the request
    def accept
    	user.friends << friend
    	destroy
    end

    def not_friends
      errors.add(:friend, 'is already added') if user.friends.include?(friend)
    end
    
end
