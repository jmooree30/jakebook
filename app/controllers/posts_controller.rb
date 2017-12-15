class PostsController < ApplicationController
	def index
		@posts = Posts.all
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

	def show
	end 

	def destroy
	end 

	private

  def post_params
    params.require(:post).permit(:body)
  end 
end
