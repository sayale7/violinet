class UserToGroupsController < ApplicationController
  # GET /user_to_groups
  # GET /user_to_groups.xml
  def index
    @user_to_groups = UserToGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_to_groups }
    end
  end

  # GET /user_to_groups/1
  # GET /user_to_groups/1.xml
  def show
    @user_to_group = UserToGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_to_group }
    end
  end

  # GET /user_to_groups/new
  # GET /user_to_groups/new.xml
  def new
    @user_to_group = UserToGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_to_group }
    end
  end

  # GET /user_to_groups/1/edit
  def edit
    @user_to_group = UserToGroup.find(params[:id])
  end

  # POST /user_to_groups
  # POST /user_to_groups.xml
  def create
    @user_to_group = UserToGroup.new(params[:user_to_group])

    respond_to do |format|
      if @user_to_group.save
        flash[:notice] = 'UserToGroup was successfully created.'
        format.html { redirect_to(@user_to_group) }
        format.xml  { render :xml => @user_to_group, :status => :created, :location => @user_to_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_to_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_to_groups/1
  # PUT /user_to_groups/1.xml
  def update
    @user_to_group = UserToGroup.find(params[:id])

    respond_to do |format|
      if @user_to_group.update_attributes(params[:user_to_group])
        flash[:notice] = 'UserToGroup was successfully updated.'
        format.html { redirect_to(@user_to_group) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_to_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_to_groups/1
  # DELETE /user_to_groups/1.xml
  def destroy
    @user_to_group = UserToGroup.find(params[:id])
    @user_to_group.destroy

    respond_to do |format|
      format.html { redirect_to(user_to_groups_url) }
      format.xml  { head :ok }
    end
  end
end
