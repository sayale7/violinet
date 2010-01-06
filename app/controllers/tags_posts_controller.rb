class TagsPostsController < ApplicationController
  # GET /tag_posts
  # GET /tag_posts.xml
  def index
    @tag_posts = TagsPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tags_post }
    end
  end

  # GET /tag_posts/1
  # GET /tag_posts/1.xml
  def show
    destroy
#    @tag_posts = TagsPost.find(params[:id])
#
#    respond_to do |format|
#      format.html # show.html.erb
#      format.xml  { render :xml => @tag_posts }
#    end
  end

  # GET /tag_posts/new
  # GET /tag_posts/new.xml
  def new
    @tag_posts = TagsPost.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tag_posts }
    end
  end

  # GET /tag_posts/1/edit
  def edit
    @tag_posts = TagsPost.find(params[:id])
  end

  # POST /tag_posts
  # POST /tag_posts.xml
  def create
    #debugger
    @tag_posts = TagsPost.new(params[:tags_post])
    @post = Post.find_by_id(@tag_posts.post_id)
    respond_to do |format|
      if @tag_posts.save
        flash[:notice] = 'TagPosts was successfully created.'
        format.html { redirect_to edit_post_path(@post) }
        format.xml  { render :xml => @tag_posts, :status => :created, :location => @tag_posts }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tag_posts.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tag_posts/1
  # PUT /tag_posts/1.xml
  def update
    @tag_posts = TagsPost.find(params[:id])

    respond_to do |format|
      if @tag_posts.update_attributes(params[:tags_post])
        flash[:notice] = 'TagPosts was successfully updated.'
        format.html { redirect_to(@tag_posts) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tag_posts.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_posts/1
  # DELETE /tag_posts/1.xml
  def destroy
    @tag_posts = TagsPost.find(params[:id])
    @post = Post.find_by_id(@tag_posts.post_id)
    @tag_posts.destroy

    respond_to do |format|
      format.html { redirect_to edit_post_path(@post) }
      format.xml  { head :ok }
    end
  end
end
