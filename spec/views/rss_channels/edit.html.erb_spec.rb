require 'rails_helper'

RSpec.describe "rss_channels/edit", type: :view do
  before(:each) do
    @rss_channel = assign(:rss_channel, RssChannel.create!(
      :name => "MyString",
      :feed_url => "MyString"
    ))
  end

  it "renders the edit rss_channel form" do
    render

    assert_select "form[action=?][method=?]", rss_channel_path(@rss_channel), "post" do

      assert_select "input#rss_channel_name[name=?]", "rss_channel[name]"

      assert_select "input#rss_channel_feed_url[name=?]", "rss_channel[feed_url]"
    end
  end
end
