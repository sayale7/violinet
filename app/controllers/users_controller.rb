class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new
    if @user.signup!(params)
      @user_common = UserCommon.new
      if @user_common.save
        @user_common.update_attribute("user_id", @user.id)
      end
      @user.deliver_activation_instructions!
      flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions!"
      redirect_to root_url
    else
      render :action => :new
    end
  end
  
  def show
    if current_user
      @user = current_user
    else
      @user = User.find(params[:id]) 
    end
    @user_common = UserCommon.find_by_user_id(@user.id)
    @profile_image = ProfileImage.find_by_user_id(@user.id)
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
      redirect_to account_url
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