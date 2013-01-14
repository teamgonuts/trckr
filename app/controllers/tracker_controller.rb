class TrackerController < ApplicationController
  def index
  end

  def track
    puts "navigating to track view"
    @id = params[:id]
  end
end
