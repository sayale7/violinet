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
    is_owner?
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
    @comment = Comment.find(params[:id])
    is_owner?
    @comment.destroy
    @comments = Comment.find_all_by_commentable_type_and_commentable_id(@comment.commentable_type, @comment.commentable_id)
    flash[:notice] = t('flash.comment_destroyed')
   
    respond_to do |format|
      format.html {  redirect_to '/' + @comment.commentable_type.to_s.downcase.pluralize + '/' + @comment.commentable_id.to_s }
      format.js
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
  
  def is_owner?
    no_user = true
    type = Kernel.const_get(@comment.commentable_type.to_s)
    type = type.find_by_id(@comment.commentable_id)
    type.attributes.each do |attribute_of_type|
      if attribute_of_type[0].to_s.eql?("user_id")
        no_user = true
      else
        no_user = false
      end
    end
    if no_user
      if type.user_id.to_s.eql?(current_user.id.to_s)
        @current_one = true
      else
         @current_one = false
      end
    else
      if type.id.to_s.eql?(current_user.id.to_s)
        @current_one = true
      else
        @current_one = false
      end
    end
  end
  
end
