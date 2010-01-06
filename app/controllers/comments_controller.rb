class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])
    if current_user
      @profile_image = ProfileImage.find_by_user_id(current_user.id)
    end
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @post }
        format.js
      end
    else
      redirect_to @post
    end
  end
  
  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find_by_id(@comment.post_id)
    @comment.destroy
    
    respond_to do |format|
      flash[:notice] = t("common.delete_success")
      format.html { redirect_to @post }
      format.xml  { head :ok }
    end
  end
  
end
