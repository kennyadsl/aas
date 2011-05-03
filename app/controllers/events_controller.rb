class EventsController < ApplicationController
  # GET /events
  # GET /events.xml
  def index
    @events = Event.all
    @challenge = Challenge.new
    @sidebar = false

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
      format.js
    end
  end

end
