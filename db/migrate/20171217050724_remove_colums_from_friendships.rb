class RemoveColumsFromFriendships < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :friendships, :friend
  end
end
