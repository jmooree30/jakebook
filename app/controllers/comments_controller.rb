class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			flash[:notice]="Comment posted."
			redirect_to root_path
		else 
			flash[:alert]="Error"
			redirect_to root_path
		end
	end

	private

    def comment_params
      params.require(:comment).permit(:body, :name, :post_id)
    end 
end