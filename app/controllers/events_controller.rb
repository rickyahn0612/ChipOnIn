class EventsController < ApplicationController
  before_filter :load_eventable

  def show
    @user = User.find(params[:user_id])
    @event = Event.find(params[:id])
    @item = @event.items 
    @volunteer = @event.volunteers
    @volunteers = @event.volunteers.new
  end

  def new
    @user = User.find(params[:user_id])
  	@event = @eventable.events.new
    @events = @user.events
    @items = @user.items
  end

  def update
    @user = User.find(params[:user_id])
    @event = Event.find(params[:id])
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to user_event_path(@user, @event), notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      end
    end	
  end

  def create
    @user = User.find(params[:user_id])
    @events = @user.events
    @event = @eventable.events.create!(event_params)
    if @event.save
      respond_to do |format|
        format.html { redirect_to user_event_path(@user, @event)}
        format.js
      end  
    else
      render :new
    end
  end

  def edit
  	@event = Event.find(params[:id])
  end

  def destroy 
  	@event = Event.find(params[:id])
  	@event.destroy 
	  respond_to do |format|
	  format.html { redirect_to new_user_event_path }
	  format.js
    end
  end
private
  def event_params
    params.require(:event).permit(:name, :date, :time, :photo)
  end
  def load_eventable
    resource, id = request.path.split('/')[1,2]
    @eventable = resource.singularize.classify.constantize.find(id)
  end
end
