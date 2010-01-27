class TagsController < ApplicationController
  # GET /tags
  # GET /tags.xml
  load_and_authorize_resource
  
  def index
    unless params[:taggable_type].nil?
      @taggable_type =  params[:taggable_type]
    end
    @tags = Tag.find_all_by_taggable_type(@taggable_type)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tags }
    end
  end

  # GET /tags/1
  # GET /tags/1.xml
  def show
    @tag = Tag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tag }
    end
  end

  # GET /tags/new
  # GET /tags/new.xml
  def new
    @tag = Tag.new
    @taggable_type =  params[:taggable_type]  
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tag }
    end
  end

  # GET /tags/1/edit
  def edit
    @tag = Tag.find(params[:id])
  end

  # POST /tags
  # POST /tags.xml
  def create
    @tag = Tag.new(params[:tag])
    @taggable_type = @tag.taggable_type
    
    respond_to do |format|
      if @tag.save
        flash[:notice] = 'Tag was successfully created.'
        format.html { redirect_to tags_path(:taggable_type  => @taggable_type) }
        format.xml  { render :xml => @tag, :status => :created, :location => @tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tags/1
  # PUT /tags/1.xml
  def update
    @tag = Tag.find(params[:id])
    @taggable_type = @tag.taggable_type

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        flash[:notice] = 'Tag was successfully updated.'
        format.html { redirect_to tags_path(:taggable_type  => @taggable_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.xml
  def destroy
    @tag = Tag.find(params[:id])
    @taggable_type = @tag.taggable_type
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to tags_path(:taggable_type  => @taggable_type) }
      format.xml  { head :ok }
    end
  end
  
  # def manage_tags
  #   @taggable_type = 'Post'
  #   render  :action  => 'index'
  # end
  # 
  # def manage_categories
  #   @taggable_type = 'Group'
  #   render  :action  => 'index'
  # end
end
