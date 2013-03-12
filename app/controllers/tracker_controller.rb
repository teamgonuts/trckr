class TrackerController < ApplicationController

  def index
  end

  def track
    puts "navigating to track view"
    uid = params[:id]
    @item = Item.find_by_uid(uid)

    if @item.blank?
      flash[:notice] = "Error: No item exists with codename '" + uid + "'"
      redirect_to(:action => 'index')
    end
    
  end

  #redirects to track after retrieving the url parameters
  #want a url parameter so users can link to the page
  def track_helper
    @uid = params[:uid]
    #/t/uid routes to /tracker/track/uid
    redirect_to "/t/#{@uid}"
  end
end
