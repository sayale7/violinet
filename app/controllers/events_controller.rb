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
    if @event.start_at != nil && @event.end_at != nil
      if @event.start_at > @event.end_at
        render :action  => 'new'
      else
        @event.save
        flash[:notice] = t("common.created")
        redirect_to event_path(@event)
      end
    else
      render :action => "new"
    end
  end
  
  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @event = Event.find(params[:id])
    unauthorized! if cannot? :manage, @event
    unless params[:event][:start_at] > params[:event][:end_at]
      @event.start_at = @event.start_at
      if @event.update_attributes(params[:event])
        flash[:notice] = t("common.updated")
        redirect_to(@event) 
      else
        flash[:error] = t("common.error")
        render :action => "edit" 
      end
    else
      flash[:error] = t("event.date_missmatch")
      render :action => "edit" 
    end
  end
  
  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @event = Event.find(params[:id])
    unauthorized! if cannot? :manage, @event
    @event.delete
    
    respond_to do |format|
      flash[:notice] = t("common.delete_success")
      format.html { redirect_to calendar_path(Time.now.strftime("%Y/%m"))}
      format.xml  { head :ok }
    end
  end
  
  
end
