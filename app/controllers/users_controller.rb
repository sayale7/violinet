class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save #signup!(params)
      @user.update_attribute(:active, true)
      @user_common = UserCommon.new
      if @user_common.save
        @user_common.update_attribute("user_id", @user.id)
      end
      # @user.deliver_activation_instructions!
      flash[:notice] = t("register.success")
      redirect_to login_url
    else
      render :action => :new
    end
  end
  
  def show
    if current_user
      if params[:id].to_s.eql?('current') || params[:id].to_s.eql?(current_user.id.to_s)
        @user = current_user
        @current_one = true
      else
        @user = User.find(params[:id])
        @current_one = false
      end
    else
      @user = User.find(params[:id])
      @current_one = false
    end
    @user_common = UserCommon.find_by_user_id(@user.id)
    @profile_image = ProfileImage.find_by_user_id(@user.id)
    @comment = Comment.new
    @comments = @user.comments
    @entries = @user.profile_entries.all(:order => "created_at DESC").paginate :per_page => 3, :page => params[:page], :include => :profile_entry
  end
  
  def edit
    @user = current_user
    @profile_image = ProfileImage.find_by_user_id(@user.id)
  end
  
  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      @profile_image = ProfileImage.find_by_user_id(@user.id)
      flash[:notice] = "Account updated!"
      redirect_to user_path(@user)
    else
      render :action => :edit
    end
  end
  
  def destroy_user
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    redirect_to root_url
  end
end