module EventsHelper
  def show_user_bg
  	if @events.photo.file?
      "background:url(#{@events.photo.url}) no-repeat fixed left top; background-size: cover; background-position:right bottom; "    
    else
      "background: #3e3e3e;"
    end
  end
end
