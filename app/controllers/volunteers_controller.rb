class VolunteersController < ApplicationController
  before_filter :load_volunteerable
  def new
  	@events = Event.find(params[:event_id])
  	@items = Item.find(params[:item_id])
  	@volunteer = @volunteerable.volunteers.new
  end

  def create
  	@user = User.find(params[:user_id])
  	@event = Event.find(params[:event_id])
  	@item = Item.find(params[:item_id])
    @items = @event.items.order("created_at desc")
    @volunteer = @item.volunteers.create!(volunteer_params)
    if @volunteer.save
      respond_to do |format|
        format.html { redirect_to user_event_path(@user, @event, @volunteer)}
        format.js
      end  
      @volunteer.make_it_happen
    else
      render :new
    end
  end

  def index
  end

  def edit
  end

  def show
  end
private
  def volunteer_params
    params.require(:volunteer).permit(:name, :email, :phone, :quantity_given)
  end
  def load_volunteerable
    resource, id = request.path.split('/')[1,2]
    @volunteerable = resource.singularize.classify.constantize.find(id)
  end
end
