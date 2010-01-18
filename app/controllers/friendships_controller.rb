class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to current_user
    else
      flash[:error] = "Unable to add friend."
      redirect_to current_user
    end
  end

  def destroy
    if params[:user_id]
      user = User.find(params[:user_id])
      @friendship = user.friendships.find_by_friend_id(current_user.id)
    else
      @friendship = current_user.friendships.find_by_user_id(current_user.id)
    end
    @inverse_friendship = Friendship.find_by_user_id_and_friend_id(@friendship.friend_id, current_user.id)
    @friendship.destroy 
    unless @inverse_friendship.nil?
    @inverse_friendship.destroy
    end
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end
end
