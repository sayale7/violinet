class FriendshipsController < ApplicationController

  def create
    is_current?
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = t('user.friend_added')
    else
      flash[:error] = t('user.add_friend_error')
    end
    if @current_one
      @user = current_user
    else
      @user = User.find(params[:friend_id])
    end
    respond_to do |format|
      format.html { redirect_to current_user }
      format.js
    end
  end

  def destroy
    is_current?
    if params[:user_id]
      user = User.find(params[:user_id])
      @friendship = user.friendships.find_by_friend_id(current_user.id)
    else
      @friendship = current_user.friendships.find_by_user_id(current_user.id)
    end
    @inverse_friendship = Friendship.find_by_user_id_and_friend_id(@friendship.friend_id, current_user.id)
    @user = User.find(@friendship.friend_id)
    @friendship.destroy 
    unless @inverse_friendship.nil?
      @inverse_friendship.destroy
    end
    flash[:notice] = t('user.destroyed_friendship')
    respond_to do |format|
      format.html { redirect_to current_user }
      format.js
    end
  end
  
  private
  
  def is_current?
    if params[:from_current].to_s.eql?("true")
      @current_one = true
    else
      @current_one = false
    end
  end

end
