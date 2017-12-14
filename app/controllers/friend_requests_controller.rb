class FriendRequestsController < ApplicationController
	

	def index
		@incoming = FriendRequest.where(friend: current_user)
		@outgoing = current_user.friend_requests
	end

	def create
		friend = User.find(params[:friend_id])
		@friend_request = current_user.friend_requests.new(friend: friend)

		if @friend_request.save
			flash[:notice]="Friend request sent."
			redirect_to users_path
		else
			flash[:alert]="Friend request not sent."
			redirect_to root_path
		end
	end
	
	def update
		@friend_request.accept
		flash[:notice]="Friend added!"
		redirect_to root_path
	end

	def destroy
		@friend_request.destroy
		head :no_content
	end


	private

	def set_friend_request
		@friend_request = FriendRequest.find(params[:id])
	end
end



