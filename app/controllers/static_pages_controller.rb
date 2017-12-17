class StaticPagesController < ApplicationController

	def index
		@posts = Post.all.order(created_at: :desc)
		@comment = Comment.new
	end 
end
