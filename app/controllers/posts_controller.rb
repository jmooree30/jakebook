class PostsController < ApplicationController
	def index
		@posts = Post.all
	end 

	def new 
	end 

	def create
		@post = current_user.posts.new(post_params)
		if @post.save
			flash[:notice]="Post created."
			redirect_to user_path(current_user)
		else 
			flash[:alert]="Post failed"
			redirect_to user_path(current_user)
		end 
	end 

	def upvote 
		@post = Post.find(params[:id])
		@post.upvote_by current_user
		redirect_back fallback_location: root_path
	end  

	def downvote
		@post = Post.find(params[:id])
		@post.downvote_by current_user
		redirect_back fallback_location: root_path
	end

	private

	def post_params
		params.require(:post).permit(:body)
	end 
end
