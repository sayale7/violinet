class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
      format.atom
    end
  end
  
  def myblog
    @posts = Post.all(:conditions => ["user_id = " + current_user.id.to_s + " and created_at  > '" + (Time.now - 60.day).strftime("%Y-%m-%d %H:%M:%S") + "'"])
    #@posts = Post.all(:conditions => {:created_at => (Time.now.midnight - 2.day)})
    
    respond_to do |format|
      format.html # myblog.html.erb
      format.xml  { render :xml => @posts }
      format.atom
    end
  end
  
  def myblogarchiv
    @posts = Post.all(:conditions => ["user_id = " + current_user.id.to_s + " and created_at  < '" + (Time.now - 60.day).strftime("%Y-%m-%d %H:%M:%S") + "'"])
    #@posts = Post.all(:conditions => {:created_at => (Time.now.midnight - 2.day)})
    
    respond_to do |format|
      format.html # myblog.html.erb
      format.xml  { render :xml => @posts }
      format.atom
    end
  end
  
  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end
  
  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end
  
  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @tags_post = TagsPost.new
    @tags_posts = Array.new
    @tags_posts = TagsPost.find_all_by_post_id(@post.id)
    @tags = Array.new
    @tags = Tag.all
    for tag_post in @tags_posts do
      for tag in @tags do
        if tag.id == tag_post.tag_id
          @tags.delete(tag)
        end
      end
    end
  end
  
  # POST /posts
  # POST /posts.xml
  def create
    #@post = Post.new(params[:post])
    @user = User.find_by_id(current_user)
    @post = @user.posts.new(params[:post])
    
    respond_to do |format|
      if @post.save
        flash[:notice] = t("common.created")
        format.html { redirect_to edit_post_path(@post) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    #debugger
    @post = Post.find(params[:id])
    
    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = t("common.updated")
        format.html { redirect_to(@post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @tags_posts = Array.new
    @tags_posts = TagsPost.find_all_by_post_id(@post.id)
    for tag_post in @tags_posts do
      tag_post.destroy
    end
    
    if @post.delete
      respond_to do |format|
        flash[:notice] = t("common.delete_success")
        format.html { redirect_to(posts_url) }
        format.xml  { head :ok }
      end
    end
    
  end
end
