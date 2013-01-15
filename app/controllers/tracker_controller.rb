class TrackerController < ApplicationController
  def index
  end

  def track
    puts "navigating to track view"
    @id = params[:id]
  end

  #redirects to track after retrieving the url parameters
  #want a url parameter so users can link to the page
  def track_helper
    @id = params[:id]
    redirect_to "/tracker/track/#{@id}"
  end
end
