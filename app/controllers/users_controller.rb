class UsersController < ApplicationController
	
  def index
    @users = User.all
    @incoming = FriendRequest.where(friend: current_user)
  end

  def show 
  	@user = current_user
  end 
  
end
