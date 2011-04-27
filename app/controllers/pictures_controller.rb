class PicturesController < ApplicationController
  
  def create
    @event = Event.find(params[:event_id])
    @picture = @event.pictures.create(params[:picture])
    redirect_to event_path(@event)
  end
  
  def destroy
      @event = Event.find(params[:event_id])
      @picture = @event.pictures.find(params[:id])
      @picture.destroy
      redirect_to event_path(@event)
    end

end
