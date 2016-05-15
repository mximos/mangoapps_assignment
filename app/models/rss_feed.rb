class RssFeed < ActiveRecord::Base
  include RssFeedable
  
  validates_format_of :url, :with => URI::regexp(%w(http https))
  attr_accessor :items, :published_date
  
  before_save :fetch_recent_feed!
  
  belongs_to :user
  
  scope :user_scope, ->(user) { where(user_id: user.id) }
  
  def initialize(opts={})
      @items = []
      super
  end
end
