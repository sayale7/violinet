class EventsController < ApplicationController
  
  def show
    @event = Event.find(params[:id])  
  end

  def new
    @event = Event.new
  end
  
  def edit
    @event = Event.find(params[:id])
    unauthorized! if cannot? :manage, @event
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:notice] = t("common.created")
      redirect_to event_path(@event)
    else
      flash[:error] = t("event.error")
      render :action => "new"
    end
  end
  
  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @event = Event.find(params[:id])
    unauthorized! if cannot? :manage, @event
    if @event.update_attributes(params[:event])
      flash[:notice] = t("common.updated")
      redirect_to(@event) 
    else
      flash[:error] = t("event.error")
      render :action => "edit" 
    end
  end
  
  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @event = Event.find(params[:id])
    unauthorized! if cannot? :manage, @event
    @event.destroy
    
    respond_to do |format|
      flash[:notice] = t("common.delete_success")
      format.html { redirect_to '/calendar' }
      format.xml  { head :ok }
    end
  end
  
  def destroy_flyer
    @event = Event.find(params[:id])
    @event.flyer.clear
    @event.save
    edit
    render :action  => 'edit'
  end
  
end
