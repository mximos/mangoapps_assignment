class RssFeedsController < ApplicationController
  before_action :set_rss_feed, only: [:show, :edit, :update, :destroy]

  # GET /rss_feeds
  # GET /rss_feeds.json
  def index
    @rss_feeds = RssFeed.user_scope(current_user).all
  end

  # GET /rss_feeds/1
  # GET /rss_feeds/1.json
  def show
  end

  # GET /rss_feeds/new
  def new
    @rss_feed = RssFeed.new
  end

  # GET /rss_feeds/1/edit
  def edit
  end

  # POST /rss_feeds
  # POST /rss_feeds.json
  def create
    @rss_feed = RssFeed.new(rss_feed_params)
    @rss_feed.user = @current_user
    
    respond_to do |format|
      if @rss_feed.save
        format.html { redirect_to rss_feeds_url, notice: 'Rss feed was successfully created.' }
        format.json { render :show, status: :created, location: @rss_feed }
      else
        format.html { render :new }
        format.json { render json: @rss_feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rss_feeds/1
  # PATCH/PUT /rss_feeds/1.json
  def update
    respond_to do |format|
      if @rss_feed.update(rss_feed_params)
        format.html { redirect_to rss_feeds_url, notice: 'Rss feed was successfully updated.' }
        format.json { render :show, status: :ok, location: @rss_feed }
      else
        format.html { render :edit }
        format.json { render json: @rss_feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rss_feeds/1
  # DELETE /rss_feeds/1.json
  def destroy
    @rss_feed.destroy
    respond_to do |format|
      format.html { redirect_to rss_feeds_url, notice: 'Rss feed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def recent_feeds
     @rss_feeds = RssFeed.user_scope(current_user).all
     @rss_feeds.map(&:recent_feeds!)
     @items = @rss_feeds.map(&:items).flatten.compact.sort{|i1, i2| i2.published_date <=> i1.published_date}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rss_feed
      @rss_feed = RssFeed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rss_feed_params
      params.require(:rss_feed).permit(:name, :url)
    end
end
