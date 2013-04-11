class FeedEntriesController < ApplicationController
  # GET /feed_entries
  # GET /feed_entries.json
  def index
    @feed_entries = FeedEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feed_entries }
    end
  end
end
