class UsersController < ApplicationController
	
  def index
    @users = User.all
    @incoming = FriendRequest.where(friend: current_user)
  end

  def show 
  	@user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts.all.order(created_at: :desc)
    @comment = Comment.new
    @comments = Comment.all
  end 

  private

  def post_params
    params.require(:post).permit(:body)
  end 

  def comment_params
    params.require(:comment).permit(:body, :name, :post_id)
  end 

end
