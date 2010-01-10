class CommentsController < ApplicationController
  
  def index
    @commentable = find_commentable
    @comments = @commentable.comments.find_all_by_commentable_type(@commentable.class.name)
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    @comment.commentable_type = @commentable.class.name
    if current_user
      @comment.author_id = current_user.id
    else
      @comment.author_id = 0
    end
    if @comment.save
      @blank = false
      @comments = @commentable.comments.find_all_by_commentable_type(@commentable.class.name)
      flash[:notice] = t('flash.comment_created')
      respond_to do |format|
        format.html {  redirect_to '/' + @commentable.class.name.to_s.downcase.pluralize + '/' + @commentable.id.to_s }
        format.js
      end
    else
      @blank = true
      flash[:error] = t('flash.content_blank')
      respond_to do |format|
        format.html {  redirect_to '/' + @commentable.class.name.to_s.downcase.pluralize + '/' + @commentable.id.to_s }
        format.js
      end
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  
  def destroy
    @commentable = find_commentable
    @comment = Comment.find(params[:id])
    @comment.destroy
    
    if @comment.destroy
      @comments = @commentable.comments.find_all_by_commentable_type(@commentable.class.name)
      flash[:notice] = t('flash.comment_destroyed')
      respond_to do |format|
        format.html {  redirect_to '/' + @commentable.class.name.to_s.downcase.pluralize + '/' + @commentable.id.to_s }
        format.js
      end
    else
      flash[:error] = t('flash.comment_destroy_error')
      respond_to do |format|
        format.html {  redirect_to '/' + @commentable.class.name.to_s.downcase.pluralize + '/' + @commentable.id.to_s }
        format.js
      end
    end
    
    
    
  end
  
  private

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        if value.to_s.eql?('current')
          value = current_user.id
        end
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  
end
