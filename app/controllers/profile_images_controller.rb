class ProfileImagesController < ApplicationController
  
  access_control do
    allow logged_in
  end
  
  def new
    @profile_image = ProfileImage.new
    if ProfileImage.find_by_user_id(current_user) != nil
      @profile_image_to_show = ProfileImage.find_by_user_id(current_user)
    end
    render :layout => '/layouts/users'
  end
  
  def create
    begin
      if ProfileImage.find_by_user_id(current_user) != nil
      profile_id = ProfileImage.find_by_user_id(current_user).id 
      end
      @profile_image = ProfileImage.new(params[:profile_image])
      if @profile_image.save
        unless profile_id.nil?
          image_to_destroy = ProfileImage.find(profile_id)
          image_to_destroy.destroy
        end
        flash[:notice] = t("profile_image.created")
        @profile_image_to_show = ProfileImage.find_by_user_id(current_user)
        redirect_to(new_profile_image_path)
      else    
        flash[:error] = t("profile_image.error")
        redirect_to(new_profile_image_path)
      end
    rescue
      flash[:error] = t("profile_image.error")
      redirect_to(new_profile_image_path)
    end
  end
  
  def destroy
    #TODO
  end
end