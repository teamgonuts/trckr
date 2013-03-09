class TrackerController < ApplicationController
  def index
  end

  def track
    puts "navigating to track view"
    puts params[:id]
    @uid = params[:id]
  end

  #redirects to track after retrieving the url parameters
  #want a url parameter so users can link to the page
  def track_helper
    @uid = params[:uid]
    puts @uid
    redirect_to "/tracker/track/#{@uid}"
  end
end
