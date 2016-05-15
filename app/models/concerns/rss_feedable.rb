require 'rss'
require 'open-uri'

module RssFeedable

  module ClassMethods
      
  end

  module InstanceMethods
    def recent_feeds!
      fetch_recent_feed! if @items.blank?
    end
    
    def fetch_recent_feed!
      
      open(url) do |rss|
        raw_feed = RSS::Parser.parse(rss)
        
        self.name = raw_feed.channel.title rescue nil
        
        @items ||= []
        raw_feed.items.each do |item|
          @items << build_feed_item(item)
        end
      end
    end
    
    def build_feed_item(raw_item)
      item = RssItem.new
      item.title = raw_item.title
      item.body = raw_item.description
      item.link = raw_item.link
      item.published_date = raw_item.date
      
      item
    end
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end