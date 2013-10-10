class UsersController < ApplicationController 
	def show
	  @user = User.find(params[:id])
    @eventable = @user
    @event = Event.new
    @events = @user.events
    @item = @user.items
	end

	def edit
	  @user = User.find(params[:id])
	end

	def update
	  @user = User.find(params[:id])
      respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to current_user, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      end
    end
	end

  def destroy 
    @user = User.find(params[:id])
    @user.destroy
    redirect_to current_user
  end
private
  def user_params
    params.require(:user).permit(:name, :email, :profile_pic)
  end
end