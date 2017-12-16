class UsersController < ApplicationController
	
  def index
    @users = User.all
    @incoming = FriendRequest.where(friend: current_user)
  end

  def show 
  	@user = current_user
    @post = Post.new
    @posts = current_user.posts.all
  end 

  private

  def post_params
    params.require(:post).permit(:body)
  end 
  
end
