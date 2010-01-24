class ProfileImagesController < ApplicationController
  
  access_control do
    allow logged_in
  end

  def new
    unless params[:edit].eql?('true')
      @profile_image = ProfileImage.find_by_user_id(current_user.id)
      render :layout  => '/layouts/users'
    else
      @profile_image = ProfileImage.find_by_user_id(current_user.id)
      render :action  => 'crop'
    end
  end
  
  def create
    @profile_image = ProfileImage.find_by_user_id(current_user.id)
    @profile_image.destroy
    @profile_image = ProfileImage.new(params[:profile_image])
    if @profile_image.save
      if params[:profile_image][:avatar].blank?
        flash[:notice] = "Successfully created user."
        redirect_to @profile_image
      else
        render :action => "crop"
      end
    else
      render :action => 'new'
    end
  end

  def update
    @profile_image = ProfileImage.find_by_user_id(current_user.id)
    if @profile_image.update_attributes(params[:profile_image])
      if params[:profile_image][:avatar].blank?
        flash[:notice] = "Successfully updated user."
        @user = User.find(@profile_image.user_id)
        redirect_to @user
      else
        render :action => "crop"
      end
    else
      render :action => 'edit'
    end
  end
  
  # def create
  #     begin
  #       if ProfileImage.find_by_user_id(current_user) != nil
  #       profile_id = ProfileImage.find_by_user_id(current_user).id 
  #       end
  #       @profile_image = ProfileImage.new(params[:profile_image])
  #       if @profile_image.save
  #         unless profile_id.nil?
  #           image_to_destroy = ProfileImage.find(profile_id)
  #           image_to_destroy.destroy
  #         end
  #         flash[:notice] = t("profile_image.created")
  #         @profile_image_to_show = ProfileImage.find_by_user_id(current_user)
  #         redirect_to(new_profile_image_path)
  #       else    
  #         flash[:error] = t("profile_image.error")
  #         redirect_to(new_profile_image_path)
  #       end
  #     rescue
  #       flash[:error] = t("profile_image.error")
  #       redirect_to(new_profile_image_path)
  #     end
  #   end
  
  def destroy
    #TODO
  end
end