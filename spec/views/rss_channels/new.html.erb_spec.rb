require 'rails_helper'

RSpec.describe "rss_channels/new", type: :view do
  before(:each) do
    assign(:rss_channel, RssChannel.new(
      :name => "MyString",
      :feed_url => "MyString"
    ))
  end

  it "renders new rss_channel form" do
    render

    assert_select "form[action=?][method=?]", rss_channels_path, "post" do

      assert_select "input#rss_channel_name[name=?]", "rss_channel[name]"

      assert_select "input#rss_channel_feed_url[name=?]", "rss_channel[feed_url]"
    end
  end
end
