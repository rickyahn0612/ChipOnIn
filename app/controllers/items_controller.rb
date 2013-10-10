class ItemsController < ApplicationController
  before_filter :load_itemable
  before_filter :event_show_page

  def show
    @item = Item.find(params[:id])
  end

  def new
    @eventable = Event.find(params[:event_id])
  	@item = @itemable.items.new
  end

  def create
    @user = User.find(params[:user_id])
    @itemable = Event.find(params[:event_id])
    @item = @itemable.items.new(item_params)
    if @item.save
      respond_to do |format|
        format.html { redirect_to user_event_path(@user, @itemable) }
        format.js
      end
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:user_id])
    @itemable = Event.find(params[:event_id])

    @item = Item.find(params[:id])
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to user_event_path(@user, @itemable), notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      end
    end	
  end

  def edit
  end

  def destroy
    @user = User.find(params[:user_id])
    @itemable = Event.find(params[:event_id])

    @item = Item.find(params[:id])
    @item.destroy
    redirect_to user_event_path(@user, @itemable)
  end 

private
  def item_params
    params.require(:item).permit(:name, :quantity_have, :quantity_needed)
  end
  def load_itemable
    resource, id = request.path.split('/')[1,2]
    @itemable = resource.singularize.classify.constantize.find(id)
  end

  def event_show_page
  end
end
