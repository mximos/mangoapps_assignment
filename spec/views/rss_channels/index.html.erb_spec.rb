require 'rails_helper'

RSpec.describe "rss_channels/index", type: :view do
  before(:each) do
    assign(:rss_channels, [
      RssChannel.create!(
        :name => "Name",
        :feed_url => "Feed Url"
      ),
      RssChannel.create!(
        :name => "Name",
        :feed_url => "Feed Url"
      )
    ])
  end

  it "renders a list of rss_channels" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Feed Url".to_s, :count => 2
  end
end
