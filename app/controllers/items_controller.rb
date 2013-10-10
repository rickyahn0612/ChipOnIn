class ItemsController < ApplicationController
  before_filter :load_itemable
  def show
    @item = Item.find(params[:id])
  end

  def new
    @eventable = Event.find(params[:event_id])
  	@item = @itemable.items.new
  end

  def create
    @itemable = Event.find(params[:event_id])
    @item = @itemable.items.new(item_params)
    if @item.save
      redirect_to current_user
    else
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to current_user, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      end
    end	
  end

  def edit
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to current_user
  end 

private
  def item_params
    params.require(:item).permit(:name, :quantity_have, :quantity_needed)
  end
  def load_itemable
    resource, id = request.path.split('/')[1,2]
    @itemable = resource.singularize.classify.constantize.find(id)
  end
end
