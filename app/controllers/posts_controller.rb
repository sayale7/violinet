class PostsController < ApplicationController
  
  uses_tiny_mce :options => {
                               :theme => 'advanced',
                               :plugins => %w{ safari spellchecker pagebreak style layer table save advhr advimage advlink emotions iespell inlinepopups insertdatetime preview media searchreplace print contextmenu paste directionality fullscreen noneditable visualchars nonbreaking xhtmlxtras template },
                               :theme_advanced_buttons1 => %w{save, bold italic underline strikethrough | justifyleft justifycenter justifyright justifyfull | styleselect formatselect fontselect fontsizeselect},
                               :theme_advanced_buttons2 => %w{cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,cleanup,help, image,|,code},
                               :theme_advanced_buttons3 => %w{ablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen,insertdate,inserttime,preview,|,forecolor,backcolor},
                               :theme_advanced_buttons4 => %w{insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage},
                               :theme_advanced_toolbar_location => 'top',
                               :theme_advanced_toolbar_align => "left",
                               :theme_advanced_statusbar_location => "bottom",
                               :theme_advanced_resizing => true
                             }
  # GET /posts
  # GET /posts.xml
  def index
    if params[:user_id]
      @posts = User.find(params[:user_id]).posts
    else
      interval_search = Post.from_date(from(params[:from]), to(params[:to]))
      unless params[:search].to_s.eql?("")
        sphinx_search = Post.search params[:search]
        @posts = interval_search & sphinx_search
      else
        @posts = interval_search
      end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
      format.atom
    end
  end
  
  def myblog
    interval_search = Post.my_posts(current_user.id).from_date(from(params[:from]), to(params[:to]))
    sphinx_search = Post.search params[:search]
    @posts = interval_search & sphinx_search
    
    respond_to do |format|
      format.html # myblog.html.erb
      format.xml  { render :xml => @posts }
      format.atom
    end
  end
  
  def add_tags
    @post = Post.find(params[:id])
    tags = Tag.find_all_by_id(params[:tags])
    tags.each do |tag|
      Tagging.find_or_create_by_tag_id_and_post_id(tag.id, @post.id)
    end
    @not_in_post_tags = Tag.all() - @post.tags
    respond_to do |format|
      format.html { redirect_to('/posts/' + params[:id].to_s + '/edit') }
      format.js
    end
  end
  
  def remove_tags
    @post = Post.find(params[:id])
    tags = Tag.find_all_by_id(params[:tags])
    tags.each do |tag|
      Tagging.find_by_tag_id_and_post_id(tag.id, @post.id).destroy
    end
    @not_in_post_tags = Tag.all() - @post.tags
    respond_to do |format|
      format.html { redirect_to('/posts/' + params[:id].to_s + '/edit') }
      format.js
    end
  end
  
  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])
    if current_user && current_user.id.to_s.eql?(@post.user_id.to_s)
      @current_one = true
    else
      @current_one = false
    end
    @comment = Comment.new
    @comments = @post.comments
    @tags = Array.new
    TagName.find_all_by_language_and_tag_id(I18n.locale.to_s, @post.tags).each do |item|
      @tags.push(item.name)
    end
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
    @not_in_post_tags = Tag.all() - @post.tags
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
  
  
  private
  
  def from(time)
    from = Time.new
    if time.to_s.eql?("")
      from = 6.weeks.ago
    else
      from = Time.parse(time.to_s)
    end
    
  end
  
  def to(time)
    to = Time.new
    if time.to_s.eql?("")
      to = Time.now
    else
      to = Time.parse(time.to_s)
    end
  end
  
end
