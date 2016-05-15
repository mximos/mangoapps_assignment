require 'rails_helper'

RSpec.describe RssFeed, type: :model do

  before do
    @rss_feed = RssFeed.new(name: "Test Name", :url => "http://example.com")
  end

  describe "rss_feed" do
    it "should allow to assign and access name and feed url" do
      expect(@rss_feed.name).to eql("Test Name")
      expect(@rss_feed.feed_url).to eql("http://example.com")
    end
    
    it "should not allow to assign invalid feed url" do
      @rss_feed.feed_url = "invalid@url"
      expect(@rss_feed).to be_invalid
    end
    
    it "should return feeds" do
      @rss_feed.recent_feeds!
      expect(@rss_feed.items).to be_kind_of(RssItem)
    end
    
  end
end
