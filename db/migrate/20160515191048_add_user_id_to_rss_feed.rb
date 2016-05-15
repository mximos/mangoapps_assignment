class AddUserIdToRssFeed < ActiveRecord::Migration
  def change
    add_column :rss_feeds, :user_id, :string
  end
end
