class ProfileEntriesController < ApplicationController
  
  def create
    @user = User.find(params[:user_id])
    @profile_entry = @user.profile_entries.new(params[:profile_entry])
    @profile_image = ProfileImage.find_by_user_id(@user.id)
    if @profile_entry.save
      flash[:notice] = t("common.created")
      respond_to do |format|
        format.html { redirect_to @user }
        format.js
      end
    else
      redirect_to @user
    end
  end
  
  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    #    @user = User.find(params[:user_id])
    @profile_entry = ProfileEntry.find(params[:id])
    @user = User.find(@profile_entry.user_id)
    
    if @profile_entry.destroy
      respond_to do |format|
        flash[:notice] = t("common.delete_success")
        format.html { redirect_to @user }
        format.xml  { head :ok }
      end
    end
  end
  
  def show
    destroy
  end
  
end
