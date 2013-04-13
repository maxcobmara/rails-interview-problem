class FeedEntriesController < ApplicationController
  # GET /feed_entries
  # GET /feed_entries.json
  def index
    @feed_entries = FeedEntry.paginate(page: params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feed_entries }
    end
  end
  
  def comments
  end
end
