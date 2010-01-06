require 'icalendar' # Einbinden der iCalendar-Library
require 'open-uri'
class EventsController < ApplicationController
  
  def export_events
    @event = Event.find(params[:id])
    @calendar = Icalendar::Calendar.new
    event               = Icalendar::Event.new
    event.start         = @event.start_at.strftime("%Y%m%dT%H%M%S")
    event.end           = @event.end_at.strftime("%Y%m%dT%H%M%S")
    event.summary       = @event.name
    event.description   = @event.description
    event.location      = @event.spot
    @calendar.add event
    @calendar.publish
    headers['Content-Type'] = "text/calendar; charset=UTF-8"
    render :layout => false, :text => @calendar.to_ical
  end
  
  def show
    # Open a file or pass a string to the parser
     cal_file  = open('http://www.google.com/calendar/ical/dasjetzt%40gmail.com/public/basic.ics') {|f| f.read }
     
     # Parser returns an array of calendars because a single file
     # can have multiple calendars.
     cals = Icalendar.parse(cal_file)
     cal = cals.first

     # Now you can access the cal object in just the same way I created it
     event = cal.events.first
     @event = Event.new
     @event.start_at    =     event.start.strftime("%Y%m%dT%H%M%S")      
     @event.end_at      =     event.end.strftime("%Y%m%dT%H%M%S")        
     @event.name                                  =     event.summary    
     @event.description                           =     event.description
     @event.spot                                  =     event.location   
     
    #@event = Event.find(params[:id])  
  end
  
  def new
    @event = Event.new
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def create
    @event = Event.new(params[:event])
    
    respond_to do |format|
      if @event.save
        flash[:notice] = t("common.created")
        format.html { redirect_to event_path(@event) }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @event = Event.find(params[:id])
    
    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = t("common.updated")
        format.html { redirect_to(@event) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.delete
    
    respond_to do |format|
      flash[:notice] = t("common.delete_success")
      format.html { redirect_to calendar_path(Time.now.strftime("%Y/%m"))}
      format.xml  { head :ok }
    end
  end
  
  
end
