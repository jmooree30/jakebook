class FriendRequest < ApplicationRecord
	belongs_to :user
	belongs_to :friend, class_name: 'User'

    # This method will build the actual association and destroy the request
    def accept
    	user.friends << friend
    	destroy
    end
    
end
